# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=(python-myhdl python2-myhdl)
pkgver=0.11
pkgrel=1
pkgdesc="a Python-Based Hardware Description Language"
arch=('any')
url="http://www.myhdl.org/"
license=('LGPL')
makedepends=('python-sphinx' 'python-setuptools' 'python2-setuptools')

source=("myhdl-$pkgver.tar.gz::https://github.com/myhdl/myhdl/archive/$pkgver.tar.gz")
md5sums=('47be668d2cbfd7894a707a6e1ffce742')

build() {
  cd "$srcdir/myhdl-$pkgver"
  
  cd $srcdir/myhdl-$pkgver/doc
  PYTHONPATH=$srcdir/myhdl-$pkgver make man
  
  cd $srcdir/myhdl-$pkgver/cosimulation/icarus
  make
}

package_python-myhdl() {
  depends=('python' 'iverilog')

  cd "$srcdir/myhdl-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  
  install -m 0644 -D ./LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
  install -m 0644 -D ./doc/build/man/myhdl.1 $pkgdir/usr/share/man/man1/myhdl.1
  install -m 0755 -D ./cosimulation/icarus/myhdl.vpi $pkgdir/usr/lib/ivl/myhdl.vpi
}

package_python2-myhdl() {
  depends=('python2' 'iverilog')

  cd "$srcdir/myhdl-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
  
  rm -rf $pkgdir/usr/share/myhdl
  
  install -m 0644 -D ./LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

