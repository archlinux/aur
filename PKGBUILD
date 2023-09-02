# Maintainer: Gabriel Araujo <gabriel_scf@hotmail.com>

pkgname=gambit-git
pkgver=16.1.0a1
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxwidgets-gtk3' 'python')
makedepends=('git' 'cython')
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
  
  CXXFLAGS+=" -std=c++11 -fpermissive" ./configure --prefix=/usr --enable-enumpoly
  make
  
  CFLAGS+=" -std=c++11 -fpermissive" python setup.py build
}

package() {
  cd "gambit"
  make DESTDIR="$pkgdir/" install
  
  python setup.py install --root="$pkgdir"
}
