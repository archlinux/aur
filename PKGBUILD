# $Id: PKGBUILD 263727 2016-04-01 16:25:05Z andyrtr $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>

_pkgname=xorg-xinit
pkgname=xorg-xinit-git
pkgver=1.4.1.r1.g4f54d18
pkgrel=2
pkgdesc="X.Org initialisation program "
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libx11' 'xorg-xauth' 'xorg-xrdb' 'xorg-xmodmap' 'inetutils')
makedepends=('git' 'xorg-util-macros')
optdepends=('xorg-twm' 'xterm')
backup=('etc/X11/xinit/xserverrc'
        'etc/X11/xinit/xinitrc')
source=("$pkgname::git://anongit.freedesktop.org/git/xorg/app/xinit"
        06_move_serverauthfile_into_tmp.diff
        fs25361.patch
        fs46369.patch
        xserverrc)
options=(!emptydirs)
sha256sums=('SKIP'
            'a5c6ced5822bbb3145e0f30a4b12995782ca6d80ff2d927851ec91b5e41212cb'
            '7cd5941b962542117fada9bbb80f76db99eee14fa951d1a4a09e0f386fcef562'
            '6e2c44b997e604db167f00168e8b6c68257be50447d7a80856b4aa910f52351e'
            '5e87bff928c143d9db9966048f6530e83e9e9a1cac09ce4c25f8aabc08611b6f')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/xinit-//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../06_move_serverauthfile_into_tmp.diff
# patch -Np1 -i ../fs25361.patch
  patch -Np1 -i ../fs46369.patch
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
