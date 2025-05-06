# Maintainer: envolution
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: dale <dale@archlinux.org>
# Contributor: MCMic <come.bernigaud@laposte.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=gtetrinet
pkgver=0.7.11
pkgrel=8
pkgdesc="a fork of gtetrinet ported to gtk3"
url="https://github.com/tatankat/gtetrinet"
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
depends=(gtk3 glibc gdk-pixbuf2 glib2 cairo dconf libcanberra)
makedepends=(git)
options=('!emptydirs')
_tag='6d816eeeb7a9dcc0011ef1892c6467455f196e0e'
source=(${pkgname}-${pkgver}::git+https://github.com/tatankat/gtetrinet.git#tag=${_tag}
  dialog-patch.patch)
sha512sums=('aa1410a6397aee412a86b5be978746b7aaf35d843a0cda2eab3664140dd8c9e7b812de27c9f0cf0705782a5fe6a53b9c1f462d5ec0e7752852958084d8969011'
            'e8f4dd824576f4af4e5820d82ed6bd2f715db85a30e01441863549c1f78db5e0a624503bfb678040852b6dda5d662a6f714ef95a5a33e65d62ed5a3f4593bf13')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np2 -i ../dialog-patch.patch
}

build() {
  cd ${pkgname}-${pkgver}
  autoreconf -fvi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
  sed -i 's/^Exec=.*/Exec=gtetrinet/' gtetrinet.desktop
}

package () {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
