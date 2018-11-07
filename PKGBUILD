# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

pkgbase=python-pythran
pkgname=('python-pythran' 'python2-pythran')
pkgver=0.9.0
pkgrel=1
pkgdesc="Ahead of Time compiler for numeric kernels"
arch=('i686' 'x86_64')
url="https://pythran.readthedocs.io/"
license=('BSD')
makedepends=('python-numpy' 'python2-numpy' 'python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/serge-sans-paille/pythran/archive/$pkgver.tar.gz")
sha256sums=('f9947cd62ed43ef948e69086f25ea24eac02a6227e9744a90aecc0b40b411c5a')

prepare() {
  cp -a pythran-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pythran-$pkgver
  python setup.py build

  cd "$srcdir"/pythran-$pkgver-py2
  python2 setup.py build
}

package_python-pythran() {
  depends=('python' 'python-networkx' 'python-ply' 'python-numpy' 'python-gast' 'python-six' 'gperftools' 'gmp')
  optdepends=(
    'boost: Use system Boost libraries'
    'python-colorlog: Coloured output during compilation' 
  )
  provides=('python-pythran')
  conflicts=('python-pythran-git')

  cd "$srcdir"/pythran-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -m755 -d "${pkgdir}/usr/share/licenses/python-pythran"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-pythran/"
}

package_python2-pythran() {
  depends=('python2' 'python2-networkx' 'python2-ply' 'python2-numpy' 'python2-gast' 'python2-six' 'gperftools' 'gmp')
  optdepends=(
    'boost: Use system Boost libraries'
    'python2-colorlog: Coloured output during compilation'
  )
  provides=('python2-pythran')
  conflicts=('python2-pythran-git')

  cd "$srcdir"/pythran-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1  --skip-build
  mv "$pkgdir"/usr/bin/pythran "$pkgdir"/usr/bin/pythran2
  mv "$pkgdir"/usr/bin/pythran-config "$pkgdir"/usr/bin/pythran2-config
  install -m755 -d "${pkgdir}/usr/share/licenses/python2-pythran"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-pythran/"
}
