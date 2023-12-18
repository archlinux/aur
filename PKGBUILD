# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.2.112
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL)
depends=(gcc-libs libdecaf mbedtls2-dtls)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('458a7eef09951d97f35946b640ab25d6345ebe215413d5d76ef276b8e23a9a7e')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i '89i include_directories(/usr/include/mbedtls2)' CMakeLists.txt
    sed -i -e "s|PRIVATE \${MBEDTLS_TARGETS}|PRIVATE \${MBEDTLS_TARGETS} -L/usr/lib/mbedtls2|" src/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_STATIC=OFF \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=unused-parameter" \
    -DDISABLE_MBEDTLS_SEARCH=ON \
    -DENABLE_TESTS_COMPONENT=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
