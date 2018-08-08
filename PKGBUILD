# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=cpprestsdk
pkgver=2.10.3
pkgrel=1
pkgdesc="A cross-platform, modern, and asynchronous library that enables developers to access and author connected applications"
arch=('i686' 'x86_64')
url="https://github.com/Microsoft/cpprestsdk/"
license=('Apache')
depends=('boost' 'websocketpp' 'openssl>=1.0.0')
makedepends=('cmake>=2.6.0')
conflicts=('casablanca' 'casablanca-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/cpprestsdk/archive/v${pkgver}.tar.gz")
sha512sums=('0003d1230f7f26424b71f705fd95c3907b60ac0d574ef6199081a8edd385d1469f405cf973c074fe6a4fc71f585e5e42862940d285ba575075dec4cb27774c36')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  cmake ../Release \
    -DBUILD_TESTS=OFF \
    -DBUILD_SAMPLES=OFF \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make  -j`nproc`
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ThirdPartyNotices.txt ${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices
}
