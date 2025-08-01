# Maintainer: crl <crl18039102576@126.com>

pkgbase=rmm
pkgname=(rmm python-rmm)
pkgver=25.06.00
pkgrel=2
pkgdesc="RAPIDS Memory Manager"
url="https://github.com/rapidsai/rmm"
arch=('x86_64')
license=('Apache-2.0')
depends=('gcc-libs' 'cuda' 'nvtx3' 'rapids-logger')
makedepends=('cmake' 'gcc' 'ninja' 'cython' 'python-build' 'python-installer' 'python-wheel')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "system-lib.patch" "missing-pkg.patch")
sha256sums=(
    '719f9d06dcc929ef315627f1dc574077006e5c80c85e86ff8e8126e6aafac021'
    'e6e7a0f4e069956eaa5de92a03a9d64c5d4bfbf12156eb0f69ca9f5d2f299ded'
    '9b10ca24bf8da07d02d188c80d18556cb450c3ea70510e4680d8ac7cdac72249'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 cpp/CMakeLists.txt < "$srcdir/system-lib.patch"
    patch -p1 python/rmm/CMakeLists.txt < "$srcdir/missing-pkg.patch"
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
