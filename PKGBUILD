# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit-git
pkgver=16.0.1.r11.ge311dbed
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk2' 'python2')
makedepends=('git' 'cython2')
provides=('gambit')
conflicts=('gambit')
source=(git+https://github.com/gambitproject/gambit.git)
options=('!makeflags')
md5sums=('SKIP')

pkgver() {
  cd "gambit"
  git describe --tags|sed 's+-+.r+'| sed 's+-+.+' | cut -c2-
}

build() {
  cd "gambit"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  
  CXXFLAGS+=" -std=c++11" ./configure --prefix=/usr --enable-enumpoly
  make
  cd src/python
  python2 setup.py build
}

package() {
  cd "gambit"
  make DESTDIR="$pkgdir/" install
  cd src/python
  python2 setup.py install --root="$pkgdir"
}
