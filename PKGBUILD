# Maintainer: crl <crl18039102576@126.com>

pkgbase=rapidsmpf
pkgname=(rapidsmpf python-rapidsmpf)
pkgver=26.10.00
pkgrel=1
pkgdesc="Collection of multi-GPU, distributed memory algorithms"
url="https://github.com/rapidsai/rapidsmpf"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'ucxx' 'nvtx3' 'rapids-logger' 'openmpi' 'openpmix' 'numactl')
makedepends=('cuda' 'gcc' 'cmake' 'ninja' 'cccl' 'cucollections'
             'openmpi' 'openpmix' 'numactl'
             'python' 'python-build' 'python-installer' 'python-wheel'
             'python-scikit-build-core' 'python-rapids-build-backend' 'python-mpi4py' 'cython')
_libcoro_commit=f8dd9f744c7e5e00fa8df6aa79f8dfbd573717fd
_cucascade_commit=d515bb0536b8766bae61ec60a530df394467af64
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/jbaldwin/libcoro/archive/$_libcoro_commit.tar.gz"
    "https://github.com/NVIDIA/cuCascade/archive/$_cucascade_commit.tar.gz"
    "system-lib.patch"
    "missing-pkg.patch"
    "fix-libcoro-version.patch"
)
sha256sums=('934489f5a71b8c3a980e6a6c5db708f1837e1447b65a5b65f54048bbe852eede'
            '02f18b0488d3f3ba6c89deb74d72d1480c43bca352c030d2b00f16ae0be2d3ac'
            '2bf1126f3b820bd9829608bc293704ad0099dc3085f686966ea08a15b214da0d'
            '970b408620127d15c9a66989918e6775af01652145f00743f83cdbcdd4083869'
            '05bb382870203838443c879d7269aa47ab53f03bb387bec871894b7ac06b53c0'
            '364949b0b393cfc1881e61674f5f779e6e308852685834ddd65f7edc13768a79')


prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 < "$srcdir/system-lib.patch"
    patch -p1 "python/rapidsmpf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -d "$srcdir/libcoro-$_libcoro_commit" -p1 < "$srcdir/fix-libcoro-version.patch"
    ln -srfT "$srcdir/libcoro-$_libcoro_commit" cpp/libcoro
    ln -srfT "$srcdir/cuCascade-$_cucascade_commit" cpp/cuCascade
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    export CXXFLAGS="$CXXFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    export CUDAFLAGS="$CUDAFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES='native' \
        -DBUILD_TESTS=OFF \
        -DBUILD_BENCHMARKS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -G Ninja
    cmake --build build

    cd python/rapidsmpf
    export rapidsmpf_DIR="$srcdir/$pkgbase-$pkgver/build"
    export CMAKE_CUDA_ARCHITECTURES='native'
    # Keep librapidsmpf.so in DT_NEEDED so that coro symbols are resolvable
    export LDFLAGS="${LDFLAGS//--as-needed/}"
    export CXXFLAGS="$CXXFLAGS -I$srcdir/$pkgbase-$pkgver/cpp/libcoro/include -I$srcdir/$pkgbase-$pkgver/build/libcoro/include"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_rapidsmpf() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    # libcoro headers/static library are part of rapidsmpf's public interface
    # (rapidsmpf headers include <coro/...>)
    DESTDIR="$pkgdir" cmake --install build/libcoro
}

package_python-rapidsmpf() {
    depends+=('python' 'rapidsmpf' 'python-rmm' 'python-ucxx' 'python-mpi4py')
    pkgdesc="Collection of multi-GPU, distributed memory algorithms - Python bindings"
    cd "$srcdir/$pkgbase-$pkgver/python/rapidsmpf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
