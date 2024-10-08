# Maintainer: Gabriel Araujo <gabriel_scf@hotmail.com>

pkgname=gambit-git
pkgver=16.2.0.r40.gad47d544
pkgrel=1
pkgdesc="Tools for doing computation in game theory - git version"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxwidgets-gtk3' 'python' 'python-build' 'python-installer')
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
  
  CXXFLAGS+=" -std=c++17 -fpermissive" ./configure --prefix=/usr
  
  make
  
  CFLAGS+=" -std=c++17 -fpermissive" python -m build --wheel --no-isolation
}

package() {
  cd "gambit"
  make DESTDIR="$pkgdir/" install
  
  python -m installer --destdir="$pkgdir" dist/*.whl
}
