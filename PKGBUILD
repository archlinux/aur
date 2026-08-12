# Maintainer: crl <crl18039102576@126.com>

pkgbase=libraft
pkgname=(libraft python-pylibraft python-raft-dask)
pkgver=26.08.00
pkgrel=1
pkgdesc="Reusable Accelerated Functions and Tools for Vector Search and More"
url="https://github.com/rapidsai/raft"
arch=('x86_64')
license=('Apache-2.0')
depends=(cuda rmm nccl)
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
)
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "system-lib-dask.patch"
    "missing-include.patch"
)
sha256sums=('0cfde0970198653fd8734eb86e870981d8c7f7507fbfedc7dbd33fc6534e8009'
            '8bd0c372711f9320205179543bc2dbd7ff7b1b53e604dc4cef24fd140ee0e9a4'
            '81c9650b01a8b3810aaa92923fd85d43fad64d1692e8eb25b7086754599f5e95'
            'c1b4971c184c733d99c6abeec8ae24e6b5dc9bdd0780bc13a27934ba27f6e87e'
            'b8b5368103ef4b43cab59f0427dfae2b89d5f22ad033bcf0e8a52b21c96dea6f')

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
