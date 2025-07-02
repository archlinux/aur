# Maintainer: crl <crl18039102576@126.com>

pkgbase=libraft
pkgname=(libraft python-pylibraft python-raft-dask)
pkgver=25.06.00
pkgrel=2
pkgdesc="RAFT contains fundamental widely-used algorithms and primitives for machine learning and information retrieval. The algorithms are CUDA-accelerated and form building blocks for more easily writing high performance applications."
url="https://github.com/rapidsai/raft"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
conflicts=('cutlass-headers') # libraft needs a specific version of cutlass-headers
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "cython-fix.patch" 
    "system-lib.patch"
    "missing-pkg.patch"
    "missing-pkg-dask.patch"
)
sha256sums=(
    '5bef9bf52c56f7efb0f120130bd1d6d493ee144f1f7328e02f0f70d5d5f2a33b'
    '46a2f4263449606a650e6285bf9caa8f9ce236275431ce72545e1eca3332583a'
    'b9441e008af77d3d197b1d699abd25eefc7656c78bd53da42b21b5f0504e2e69'
    '816ee0a489622a0f56cc479fabf20c79ef36eb81673d1da7fd0a649e372ff613'
    'SKIP'
)

prepare() {
    cd "$srcdir/raft-$pkgver"
    patch -p1 < ../../cython-fix.patch
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibraft/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "python/raft-dask/CMakeLists.txt" < "$srcdir/missing-pkg-dask.patch"
}


build() {
    cd "$srcdir/raft-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -G Ninja
    cmake --build build

    cd "$srcdir/raft-$pkgver/python/pylibraft"
    export raft_DIR="$srcdir/raft-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/raft-$pkgver/python/raft-dask"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_libraft() {
    cd "$srcdir/raft-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    rm "$pkgdir/usr/include/cuco" -r
    rm "$pkgdir/usr/lib/cmake/cuco" -r
}

package_python-pylibraft() {
    depends+=('libraft' 'python' 'python-rmm' 'python-numpy' 'python-cuda')
    cd "$srcdir/raft-$pkgver/python/pylibraft"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/test" -rf
}

package_python-raft-dask() {
    depends+=('libraft' 'python' 'python-dask-cuda' 'openucx' 'python-pylibraft' 'ucxx')
    cd "$srcdir/raft-$pkgver/python/raft-dask"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
}
