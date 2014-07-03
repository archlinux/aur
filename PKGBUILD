# $Id: PKGBUILD 201357 2013-12-09 12:20:22Z jgc $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=xorg-xinit
pkgname=xorg-xinit-git
pkgver=1.3.3.r9.g5502aaf
pkgrel=1
epoch=1
pkgdesc="X.Org initialisation program "
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('xorg-xauth' 'inetutils')
makedepends=('xorg-util-macros')
optdepends=('xorg-twm' 'xterm')
backup=(
        'etc/X11/xinit/xinitrc')
conflicts=('xorg-xinit')
provides=('xorg-xinit')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xinit"
        fs25361.patch)
options=(!emptydirs)
sha256sums=('SKIP'
            '7cd5941b962542117fada9bbb80f76db99eee14fa951d1a4a09e0f386fcef562')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/xinit-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../fs25361.patch
  sed -i -e 's,\?\*\.sh,?*,' xinitrc.cpp
}

build() {
  cd $pkgname
  autoreconf -fi
  ./configure --prefix=/usr --with-xinitdir=/etc/X11/xinit
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
