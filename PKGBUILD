# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit
pkgver=14.1.0
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk')
makedepends=('git')
provides=('gambit')
conflicts=('gambit')
source=(https://github.com/gambitproject/gambit/archive/v$pkgver.tar.gz ludecomp.diff)
md5sums=('06a8f4b4e5d990f443de900b2b95aef0'
         '4086c9c74892440e00c9be7f8ace4bce')
options=('!makeflags')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "$srcdir"/ludecomp.diff
}

build() {
  cd "$pkgname-$pkgver"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  [[ $CARCH == "X86_64" ]] && CXXFLAGS+=" -std=c++03" ./configure --prefix=/usr --disable-enumpoly
  [[ $CARCH == "i686" ]] && CXXFLAGS+=" -std=c++03" ./configure --prefix=/usr
  make 
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
