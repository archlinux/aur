# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Gianni Vialetto <g [dot] vialetto [at] gmail [dot] com>

pkgname=afterstep
_name=AfterStep
pkgver=2.2.12
pkgrel=3
pkgdesc="A Window Manager based on NextStep Interface"
arch=('i686' 'x86_64')
url="http://www.afterstep.org"
license=('GPL')
depends=('gtk2>=2.18.6' 'libpng' 'libtiff' 'readline' 'freetype2' 'dbus-core' 'librsvg')
makedepends=('libxt')
options=('!emptydirs')
changelog=ChangeLog
source=(ftp://ftp.afterstep.org/stable/${_name}-${pkgver}.tar.bz2
  desktop_entry.patch)
md5sums=('a3ab1a878270998d420bb2a5ca15801b'
         '90cb380546b5d64208f13ab4f473f56d')

prepare() {
  cd ${srcdir}/${pkgname}-devel-${pkgver}
  #fix some problems about the launcher (Slim)
  patch -p0 -i ${srcdir}/desktop_entry.patch

  ./configure --prefix=/usr --mandir=/usr/share/man
}

build() {
  cd ${srcdir}/${pkgname}-devel-${pkgver}
  make -j1 || return 1
}

package() {
  cd ${srcdir}/${pkgname}-devel-${pkgver}
  make -j1 DESTDIR=${pkgdir} install
  install -Dm644 ${_name}.desktop ${pkgdir}/usr/share/xsessions/${_name}.desktop
  
  # fix permission
  chmod 644 ${pkgdir}/usr/lib/*.a
}
