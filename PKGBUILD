# Maintainer: Humza Yaqoob <hyaq at protonmail dot ch>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeffrey 'jf' Lim <jfs.world@gmail.com>

pkgname=wmii
pkgver=3.9.2
pkgrel=4
pkgdesc="A small, dynamic window manager for X11"
arch=('i686' 'x86_64')
url="https://code.google.com/archive/p/wmii/"
licence=('MIT')
depends=('libxft' 'libxrandr' 'libxinerama' 'dash')
options=('!makeflags')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname}/${pkgname}+ixp-${pkgver}.tbz
	'fix-freetype-include.patch')
md5sums=('3d480502b7b1e2a405d941df67f16bcf'
         '97febd4a1df80aa4afbd126de1f36496')

build() {
  cd ${srcdir}/${pkgname}+ixp-${pkgver}

  patch -Np1 -i ${srcdir}/fix-freetype-include.patch

  sed -i 's|PREFIX = /usr/local|PREFIX = /usr|' config.mk
  sed -i 's|ETC = $(PREFIX)/etc|ETC = /etc|' config.mk
  sed -i 's# !=#!=#' mk/hdr.mk
  sed -i 's#env python#env python2#' alternative_wmiircs/python/wmiirc
  echo 'LIBS+=-lXrender -lX11' >>config.mk

  export MAKEFLAGS="-j1"
  make
}

package() {
  cd ${srcdir}/${pkgname}+ixp-${pkgver}
  make DESTDIR=${pkgdir} install
  install -Dm644 debian/file/wmii.desktop ${pkgdir}/usr/share/xsessions/${pkgname}.desktop
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
