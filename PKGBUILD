# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

_pkgbase=easyrpg-player
pkgname=$_pkgbase-git
pkgver=0.1.2.r174.gaf25dc2
pkgrel=1
pkgdesc="EasyRPG Player aims to be a free, RPG Maker 2000/2003 interpreter (development version)"
arch=('i686' 'x86_64')
url="https://easy-rpg.org/"
license=('GPL3' 'MIT')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
makedepends=('boost' 'git')
depends=('sdl2_mixer' 'freetype2' 'pixman' 'expat')
install=$_pkgbase.install
source=(liblcf::"git+https://github.com/EasyRPG/liblcf.git"
        $_pkgbase::"git+https://github.com/EasyRPG/Player.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd $_pkgbase

  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
  # build readers library
  cd liblcf

  ./autogen.sh
  ./configure --enable-xml
  make

  # build player
  cd ../$_pkgbase

  ./autogen.sh
  ./configure --prefix=/usr LIBS="-llcf -lexpat" \
    CPPFLAGS="-DUNIX -I$srcdir/liblcf/include" \
    LDFLAGS="-L$srcdir/liblcf/src"
  make
}

package () {
  install -Dm755 $_pkgbase/src/$_pkgbase "$pkgdir"/usr/bin/$_pkgbase
  install -Dm644 liblcf/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING-liblcf
}
