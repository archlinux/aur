# Maintainer: crl <crl18039102576@126.com>

pkgbase=libraft
pkgname=(libraft python-pylibraft python-raft-dask)
pkgver=25.08.00
pkgrel=1
pkgdesc="Reusable Accelerated Functions and Tools for Vector Search and More"
url="https://github.com/rapidsai/raft"
arch=('x86_64')
license=('Apache-2.0')
depends=(cuda rmm)
makedepends=(cuda python-build python-installer python-wheel cmake python-scikit-build-core python-rapids-build-backend ninja cython)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "missing-pkg-dask.patch"
)
sha256sums=(
    '032dce57b297e121352a1556bd9021410be30fcf319e158592f615e1990b2e58'
    '55a7ef2a7e9d2e08d6bb5355743bdc97806660e222736a8a20028b103683fffc'
    '816ee0a489622a0f56cc479fabf20c79ef36eb81673d1da7fd0a649e372ff613'
    '40a7013af054a3d24690976a00cafe5901329a01af45c42938dcbbd4a39280ac'
)

prepare() {
    cd "$srcdir/raft-$pkgver"
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
    conflicts=(cutlass-headers) # libraft needs a specific version of cutlass-headers
    cd "$srcdir/raft-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    rm "$pkgdir/usr/include/cuco" -r
    rm "$pkgdir/usr/lib/cmake/cuco" -r
}

package_python-pylibraft() {
    depends+=(libraft python python-rmm python-numpy python-cuda)
    cd "$srcdir/raft-$pkgver/python/pylibraft"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/test" -rf
}

package_python-raft-dask() {
    depends+=(libraft python python-dask-cuda openucx python-pylibraft ucxx)
    cd "$srcdir/raft-$pkgver/python/raft-dask"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
}
