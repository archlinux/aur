# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-git
pkgver=15.0.0.r18.g7542497
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git')
provides=('gambit')
conflicts=('gambit')
source=(git+https://github.com/gambitproject/gambit.git 'ludecomp.diff')
options=('!makeflags')
md5sums=('SKIP'
         '4086c9c74892440e00c9be7f8ace4bce')

pkgver() {
  cd "gambit"
  git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

prepare() {
  cd "gambit"
  patch -p1 < "$srcdir"/ludecomp.diff
}

build() {
  cd "gambit"
  aclocal
  libtoolize
  automake --add-missing
  autoconf

  CXXFLAGS+=" -std=c++03" ./configure --prefix=/usr --disable-enumpoly
  make 
}

package() {
  cd "gambit"
  make DESTDIR="$pkgdir/" install
}
