# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=olvwm
pkgver=4.4
_srcname=xview
_srcver=3.2p1.4
pkgrel=4
pkgdesc="Open Look Virtual Window Manager"
arch=('i686' 'x86_64')
url=https://en.wikipedia.org/wiki/Olwm
license=('custom')
depends=('libxpm')
makedepends=('imake')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/x/${_srcname}/${_srcname}_${_srcver}.orig.tar.gz
        http://archive.ubuntu.com/ubuntu/pool/universe/x/${_srcname}/${_srcname}_${_srcver}-28.1.debian.tar.gz
        virtual_c-regexp-fix.patch)
sha256sums=('fcc88f884a6cb05789ed800edea24d9c4cf1f60cb7d61f3ce7f10de677ef9e8d'
            'b0dcf9904f50b580ee408e93107674d77799b2126374b3d4a1db73d0e7e24cbe'
            'd2f5012f004322902844ffd92e92a3722c16e08c16c790bbe2653311139c3ae4')

prepare() {
  cd ${srcdir}/${_srcname}-${_srcver}

  # Debian patches
  for x in $(ls ${srcdir}/debian/patches | grep -v series); do
    patch -Np1 -i ${srcdir}/debian/patches/${x};
  done

  # Fix imake path
  sed -i 's@/usr/bin/X11/imake@/usr/bin/imake@g' imake

  # Fix install dirs
  sed -i 's@OPENWINHOME=/usr/openwin@OPENWINHOME=/usr@g' Build-LinuxXView.bash

  # Fix for regex functions missing from glibc 2.23
  patch -Np1 -i "${srcdir}/virtual_c-regexp-fix.patch"

  chmod 755 Build-LinuxXView.bash
}

build() {
  cd ${srcdir}/${_srcname}-${_srcver}
  ./Build-LinuxXView.bash libs olvwm
}

package() { 
  cd ${srcdir}/${_srcname}-${_srcver}

  # Install olvwm
  cd clients/${pkgname}-4.1
  make DESTDIR=${pkgdir} install install.man

  # Add license
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LEGAL_NOTICE ${pkgdir}/usr/share/licenses/${pkgname}/

  # Fix man location
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/man
}
