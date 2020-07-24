# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-myhdl-git
pkgver=0.11.r14.ga4708fa
pkgrel=1
pkgdesc="a Python-Based Hardware Description Language"
arch=('any')
url="http://www.myhdl.org/"
license=('LGPL')
makedepends=('git' 'python-sphinx' 'python-setuptools')
depends=('python' 'iverilog')
provides=('python-myhdl')
conflicts=('python-myhdl')

_gitroot='https://github.com/myhdl/myhdl.git'
_gitname='myhdl'

source=("$_gitname::git+$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  
  cd $srcdir/$_gitname/doc
  PYTHONPATH=$srcdir/$_gitname make man
  
  cd $srcdir/$_gitname/cosimulation/icarus
  make
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  
  install -m 0644 -D ./LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  install -m 0644 -D ./doc/build/man/myhdl.1 $pkgdir/usr/share/man/man1/myhdl.1
  install -m 0755 -D ./cosimulation/icarus/myhdl.vpi $pkgdir/usr/lib/ivl/myhdl.vpi
}

