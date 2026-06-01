# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgbase=cutlass
pkgname=('cutlass' 'python-cutlass')
pkgver=4.5.1
pkgrel=1
pkgdesc='CUDA Templates for Linear Algebra Subroutines'
arch=('x86_64')
url='https://github.com/NVIDIA/cutlass'
license=('BSD-3-Clause')
depends=('cuda' 'cudnn')
makedepends=('cmake' 'git' 'ninja' 'pybind11' 'python-build'
             'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/NVIDIA/$pkgbase/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('550a27be6fe92de8bed43101b64f6b52878346409472b3e94e5b82f65b5b58cb')

prepare() {
    cd "$pkgbase-$pkgver/python"
    # Remove bfloat16 from install_requires as it's incompatible with numpy 2.x
    # bfloat16 support is optional and handled gracefully at runtime
    sed -i "/'bfloat16',/d" setup_cutlass.py

    # setup_cutlass.py rebuilds pycute and cutlass_library via perform_setup()
    # before its own setup(); that pollutes build/lib and breaks the
    # cutlass_cppgen bdist_wheel. Those two wheels are built separately below,
    # so drop the perform_setup() calls and build only cutlass_cppgen here.
    sed -i '/^setup_library\.perform_setup()/d; /^setup_pycute\.perform_setup()/d' setup_cutlass.py
}

build() {
    export PATH="/opt/cuda/bin:$PATH"

    # Limit parallel jobs to prevent OOM during CUDA template compilation
    # (each nvcc can use ~10GB RAM with heavy template instantiation). Scale to
    # available memory (~11GB/job) instead of a fixed -j4, so big-RAM build hosts
    # aren't throttled to 4 of N cores; cap at 32 to bound it.
    local _jobs=$(nproc)
    local _memgb=$(awk '/MemTotal/{print int($2/1024/1024)}' /proc/meminfo 2>/dev/null || echo 16)
    local _memcap=$(( _memgb / 11 )); (( _memcap < 1 )) && _memcap=1
    (( _jobs > _memcap )) && _jobs=$_memcap
    (( _jobs > 32 )) && _jobs=32

    # CUDA 13.x cannot use GCC 16+ as its host compiler. Arch's cuda package
    # depends on gcc15, so fall back to g++-15 when the system g++ is too new.
    local _ccbin=()
    if (( $(gcc -dumpversion | cut -d. -f1) >= 16 )) && [[ -x /usr/bin/g++-15 ]]; then
        export NVCC_CCBIN=/usr/bin/g++-15
        _ccbin=(-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-15)
    fi

    cmake -S $pkgbase-$pkgver -B $pkgbase-$pkgver/build -G Ninja \
        "${_ccbin[@]}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCUTLASS_NVCC_ARCHS='75;80;86;89;90;90a' \
        -DCUTLASS_ENABLE_GTEST_UNIT_TESTS=OFF \
        -DCUTLASS_ENABLE_TESTS=OFF \
        -DCUTLASS_ENABLE_CUBLAS=ON \
        -DCUTLASS_ENABLE_CUDNN=ON \
        -DCUTLASS_ENABLE_EXAMPLES=OFF \
        -DCUTLASS_INSTALL_TESTS=OFF \
        -DCUTLASS_UNITY_BUILD_ENABLED=OFF
    cmake --build $pkgbase-$pkgver/build -j $_jobs

    # Build Python wheels
    cd "$srcdir/$pkgbase-$pkgver/python"

    # Build pycute wheel
    rm -rf build *.egg-info
    python setup_pycute.py bdist_wheel

    # Build cutlass_library wheel
    rm -rf build *.egg-info
    python setup_library.py bdist_wheel

    # Build cutlass_cppgen wheel (formerly cutlass)
    rm -rf build *.egg-info
    python setup_cutlass.py bdist_wheel
}

package_cutlass() {
    cmake --install "$srcdir/$pkgbase-$pkgver/build" --prefix "$pkgdir/usr"
    install -Dm644 \
        "$srcdir/$pkgbase-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/test"
}

package_python-cutlass() {
    pkgdesc='Python interface to CUTLASS library'
    arch=('any')
    depends=('python' 'python-cuda' 'python-pydot' 'python-scikit-build' 'python-treelib' 'pybind11')
    optdepends=('python-ml-dtypes: bfloat16 dtype support (alternative)')

    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        "$srcdir/$pkgbase-$pkgver/python/dist/pycute-"*.whl

    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        "$srcdir/$pkgbase-$pkgver/python/dist/cutlass_library-"*.whl

    python -m installer \
        --compile-bytecode 1 \
        --destdir "$pkgdir" \
        "$srcdir/$pkgbase-$pkgver/python/dist/cutlass_cppgen-"*.whl

    install -Dm644 \
        "$srcdir/$pkgbase-$pkgver/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
