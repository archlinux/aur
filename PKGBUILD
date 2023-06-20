# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.2.71
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL)
depends=(mbedtls2-dtls bcunit)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('48eace9a9c82002f0983b7030abccdd11b45370b06c0d1251a111c7fb7b869a1')

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
    -DDISABLE_MBEDTLS_SEARCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
