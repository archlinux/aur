# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=glewlwyd
pkgver=2.5.4
pkgrel=5
pkgdesc='Single-Sign-On (SSO) server with multiple factor authentication'
arch=(x86_64)
url=https://github.com/babelouest/glewlwyd
license=(GPL3)
depends=(
  glibc
  gnutls
  jansson
  libcbor.so
  libconfig.so
  libcrypt.so
  libhoel.so
  libiddawc.so
  libldap
  liboath.so
  liborcania.so
  librhonabwy.so
  libulfius.so
  libyder.so
)
makedepends=(
  cmake
  git
  mariadb-libs
  ninja
  postgresql-libs
  sqlite
  systemd
)
backup=(etc/glewlwyd/glewlwyd.conf)
_tag=36efbfd3b9851ce57106af22e6718b2c7303ee22
source=(
  git+https://github.com/babelouest/glewlwyd.git#tag=${_tag}
  glewlwyd.service
)
validpgpkeys=(8405B02FCC28EF9744C8F253FE82139440BD22B9) # Nicolas Mora <nicolas@babelouest.org>
b2sums=('SKIP'
        '3111b839f2f69a7daf9158a365ad36fddb2fd5a0ae9e63f0ef1ded4a76098fabb1fb340290755184e7ba44f7d64820d2b7980c22328ec792f6f56f85a025f931')

pkgver() {
  cd glewlwyd
  git describe --tags | sed 's/^v//'
}

build() {
 export CFLAGS+=" -Wno-implicit-function-declaration"
  cmake -S glewlwyd -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DDOWNLOAD_DEPENDENCIES=OFF
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 glewlwyd.service -t "${pkgdir}"/usr/lib/systemd/system
}

# vim: ts=2 sw=2 et:
