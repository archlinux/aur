# $Id: PKGBUILD 201357 2013-12-09 12:20:22Z jgc $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=xorg-xinit
pkgname=xorg-xinit-git
pkgver=1.3.4.r8.gc5e40f5
pkgrel=1
epoch=1
pkgdesc="X.Org initialisation program "
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx11' 'xorg-xauth' 'inetutils')
makedepends=('xorg-util-macros')
optdepends=('xorg-twm' 'xterm')
backup=(
        'etc/X11/xinit/xserverrc'
        'etc/X11/xinit/xinitrc')
conflicts=('xorg-xinit')
provides=('xorg-xinit')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xinit"
        06_move_serverauthfile_into_tmp.diff
        fs25361.patch
        xserverrc)
options=(!emptydirs)
sha256sums=('SKIP'
            'a5c6ced5822bbb3145e0f30a4b12995782ca6d80ff2d927851ec91b5e41212cb'
            '7cd5941b962542117fada9bbb80f76db99eee14fa951d1a4a09e0f386fcef562'
            '5e87bff928c143d9db9966048f6530e83e9e9a1cac09ce4c25f8aabc08611b6f')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/xinit-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../06_move_serverauthfile_into_tmp.diff
# patch -Np1 -i ../fs25361.patch
  sed -i -e 's/XSLASHGLOB.sh/XSLASHGLOB/' xinitrc.cpp
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

  install -m644 "${srcdir}/xserverrc" "${pkgdir}/etc/X11/xinit/xserverrc"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
