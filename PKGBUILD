# Maintainer: crl <crl18039102576@126.com>

pkgbase=rmm
pkgname=(rmm python-rmm)
pkgver=25.10.00
pkgrel=2
pkgdesc="RAPIDS Memory Manager"
url="https://github.com/rapidsai/rmm"
arch=('x86_64')
license=('Apache-2.0')
depends=('gcc-libs' 'cuda' 'nvtx3' 'rapids-logger')
makedepends=('cmake' 'gcc' 'ninja' 'cython' 'python-build' 'python-installer' 'python-wheel')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "system-lib.patch" "missing-pkg.patch" "fix-cudf-compile.patch")
sha256sums=(
    '33d1972bce23e9b45d0c1aedabfbc3fd2d2cb30715fa66d17088dd276d01e56c'
    '31bb6d4a02f046e2d434343c9452dab7b2d7f5c8b84f1404140e3f628a22ac0b'
    '9b10ca24bf8da07d02d188c80d18556cb450c3ea70510e4680d8ac7cdac72249'
    '0b71882e21fea70b03f7975b312f1cbfe7bdc8c52749b6303c897f264e32a4a9'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 cpp/CMakeLists.txt < "$srcdir/system-lib.patch"
    patch -p1 python/rmm/CMakeLists.txt < "$srcdir/missing-pkg.patch"
    patch -p1 cpp/include/rmm/device_uvector.hpp < "$srcdir/fix-cudf-compile.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DRMM_NVTX=ON \
        -G Ninja
    cmake --build build

    cd python/rmm
    export rmm_DIR="$srcdir/$pkgname-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_rmm() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-rmm() {
    depends+=('python-cuda' 'rmm')
    cd "$srcdir/$pkgbase-$pkgver/python/rmm"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
