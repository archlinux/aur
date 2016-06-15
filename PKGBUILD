# Contributor: Tanguy Bouzéloc <the.zauron@gmail.com>
# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>

pkgname=ion3
pkgver=20090110
pkgrel=3
pkgdesc="Tiling tabbed window manager designed with keyboard users in mind"
arch=('i686' 'x86_64')
url="http://modeemi.fi/~tuomov/ion/"
license=('custom')
depends=('lua51' 'libx11' 'libxext' 'libsm' 'libice' 'libxcb' 'libxau' 'libxdmcp')
source=(http://tuomov.iki.fi/software/dl/ion-3-${pkgver}.tar.gz
	ion3.desktop
	archlinux.patch)
md5sums=('1f17be1e87187b4af7de047187cc4930'
         'ea0c20a78da0f60463632b1149fdfeb8'
         'b1b8f5e28108d1017baf5712ddfadf75')

prepare() {
  cd ${srcdir}/ion-3-${pkgver}
  patch -Np2 -b -z .orig <../archlinux.patch
  if [ -n "${CFLAGS}" ] ; then
    cp system.mk system.mk.new
    sed -e "s:CFLAGS=-Os:CFLAGS=${CFLAGS}:" system.mk.new > system.mk
  fi
}

build() {
  cd ${srcdir}/ion-3-${pkgver}
  make ${MAKEFLAGS}
}

package() {
  cd ${srcdir}/ion-3-${pkgver}
  make PREFIX=${pkgdir}/usr ETCDIR=${pkgdir}/etc/ion3 install
  install -D -m644 ${startdir}/ion3.desktop ${pkgdir}/etc/X11/sessions/ion3.desktop
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
