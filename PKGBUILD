# Maintainer: crl <crl18039102576@126.com>

pkgbase=libraft
pkgname=(libraft python-pylibraft python-raft-dask)
pkgver=25.10.00
pkgrel=2
pkgdesc="Reusable Accelerated Functions and Tools for Vector Search and More"
url="https://github.com/rapidsai/raft"
arch=('x86_64')
license=('Apache-2.0')
depends=(cuda rmm)
makedepends=(
    cuda
    python-build
    python-installer
    python-wheel
    cmake
    python-scikit-build-core
    python-rapids-build-backend
    ninja
    cython
    cucollections
    ucxx
)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "system-lib-dask.patch"
    "missing-include.patch"
)
sha256sums=(
    '85e7334a5993c537bba4714e53b19e1ff1f42f7c32fd5003717833a3882accf8'
    '653bfe4b37e67e283affaedf57e1f11c2cf261ac3cde72fbe04ae4439fd8ede7'
    '3aaac5dc31520092ebce845e178eac077ceb399774606b90598213697a18956d'
    '669b846f461a0ddb930d85243e5b8b37614e45da54c6d02a41bf164e444b46af'
    'b8b5368103ef4b43cab59f0427dfae2b89d5f22ad033bcf0e8a52b21c96dea6f'
)

prepare() {
    cd "$srcdir/raft-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibraft/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "python/raft-dask/CMakeLists.txt" < "$srcdir/system-lib-dask.patch"
    patch -p1 "cpp/include/raft/core/comms.hpp" < "$srcdir/missing-include.patch"
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
    depends+=(cucollections)
    cd "$srcdir/raft-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
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
    depends+=(libraft python python-dask-cuda openucx python-pylibraft ucxx nccl)
    cd "$srcdir/raft-$pkgver/python/raft-dask"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
}
