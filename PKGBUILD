# Maintainer: envolution
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tiago Santos <ircalf at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libjwt
pkgver=3.2.3
pkgrel=2
pkgdesc="JWT C Library"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/benmcollins/libjwt"
license=('MPL-2.0')
depends=('jansson' 'openssl' 'gnutls' 'mbedtls')
checkdepends=('check')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/benmcollins/libjwt/archive/v${pkgver}.tar.gz"
  init-jwk_set.patch)
sha256sums=('12978f7ac2945c5a95a2732fde9800a5910fa056e64dc9ff733d4046078d2d79'
            '141a0176faa957f26a24d46b9a56bc152ab030873fc6c34012b8cd9bfad21d32')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np2 -i ../init-jwk_set.patch
}
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_PKGCONFIG=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error" \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
