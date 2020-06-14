# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kvirc-nokde
pkgver=5.0.0
pkgrel=4
pkgdesc='Qt5 based IRC-Client without KDE dependencies'
arch=('x86_64')
url='https://github.com/kvirc/KVIrc'
license=('GPL2')
depends=('qt5-multimedia'
         'qt5-svg'
         'openssl-1.0'
         'qt5-webkit'
         'phonon-qt5'
         'enchant'
         'hicolor-icon-theme'
         'python2'
         'libxss')
makedepends=('cmake')
conflicts=('kvirc')
provides=('kvirc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('452e683760221055f117d2ab4359aa432e01ce5d5e3abe80772b7a13a78b594a')

prepare() {
  cd "${srcdir}/KVIrc-${pkgver}"
  sed -i "37a#include <QPainterPath>" src/modules/iograph/libkviiograph.cpp
}

build() {
  if [[ -d "${srcdir}/KVIrc-${pkgver}"/build ]]; then
    rm -rf "${srcdir}/KVIrc-${pkgver}"/build
  fi
  mkdir "${srcdir}/KVIrc-${pkgver}"/build
  cd "${srcdir}/KVIrc-${pkgver}"/build
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWANT_QT4:BOOL='0' \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DWANT_PERL=ON \
    -DWANT_AUDIOFILE:BOOL='1' \
    -DWANT_GTKSTYLE:BOOL='1' \
    -DWANT_KDE:BOOL='0' \
    -DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
    -DOPENSSL_SSL_LIBRARY=/usr/lib/openssl-1.0/libssl.so \
    -DOPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/libcrypto.so
  make
}

package() {
  cd "${srcdir}/KVIrc-${pkgver}"/build
  make DESTDIR="${pkgdir}" install
}