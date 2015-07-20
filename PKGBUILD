# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-myhdl-git
pkgver=0.9.0.r29.g983a169
pkgrel=1
pkgdesc="a Python-Based Hardware Description Language"
arch=('any')
url="http://www.myhdl.org/"
license=('LGPL')
depends=('python' 'iverilog')
makedepends=('git')
provides=('python-myhdl')

_gitroot='https://github.com/jandecaluwe/myhdl.git'
_gitname='myhdl'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  
  cd $srcdir/$_gitname/cosimulation/icarus
  make
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  
  install -m 0644 -D ./LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  
  install -m 0755 -D $srcdir/$_gitname/cosimulation/icarus/myhdl.vpi $pkgdir/usr/lib/ivl/myhdl.vpi
}

