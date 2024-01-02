# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=bctoolbox
pkgver=5.3.5
pkgrel=1
pkgdesc='A library written in C that allows you to create and run audio and video streams'
arch=(x86_64)
url='https://gitlab.linphone.org/'
license=(GPL)
depends=(gcc-libs libdecaf mbedtls)
makedepends=(cmake)
source=(https://gitlab.linphone.org/BC/public/bctoolbox/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('d1dbbfe05fea4623e93469fd7dcf374c8680f461acfe8afc6ad22d651ec63320')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i '89i include_directories(/usr/include/mbedtls2)' CMakeLists.txt
    sed -i -e "s|PRIVATE \${MBEDTLS_TARGETS}|PRIVATE \${MBEDTLS_TARGETS} -L/usr/lib/mbedtls2|" src/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=unused-parameter" \
    -DENABLE_TESTS_COMPONENT=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DENABLE_DECAF=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
