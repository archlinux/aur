# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Yurii Kolesnykov <yurikoles at gmail dot com>
# Contributor: Gustavo <sl1pkn07 at gmail dot com>
# Contributor: Maxime Gauduin <alucryd at archlinux dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libindicator-gtk2
_pkgname=libindicator
pkgver=12.10.1
pkgrel=11
pkgdesc='Set of symbols and convenience functions for Ayatana indicators (GTK+ 2 library)'
url='https://launchpad.net/libindicator'
arch=('x86_64')
license=('GPL-3.0-only')
depends=('gtk2')
makedepends=('glib2-devel' 'python')
source=(https://launchpad.net/${_pkgname}/${pkgver%.*}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz{,.asc}
        fix-build.patch)
sha512sums=('d6d77d0309b15cf6b52539323920ab0c1594cb1c1cef8a8d67cd0f76f8ceeeac28eb6db6227563df1932e6f1fadcffac68d82982182b745257dfaf91f1c945af'
            'SKIP'
            'bfb6942ce9d113c0dbe00fb3faed610c5b61f2cb1f30735418b3bea17b2ae7b8f672770e6aa93d7d4b2a2dbe2b26be41f0acb85503a7aea0c72c1da3c2bc1662')
validpgpkeys=('6FC05581A37D71FCECE165DB5BE41E162CD6358E')  # Charles Kerr <charles.kerr@canonical.com>

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/-Werror//' {libindicator,tools}/Makefile.am
  patch -p1 -i ../fix-build.patch
  autoreconf -fi
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --libexecdir=/usr/lib/libindicator \
    --sysconfdir=/etc \
    --with-gtk=2 \
    --disable-static \
    --disable-tests
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share
}

# vim: ts=2 sw=2 et:
