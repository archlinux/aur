pkgname=pypy3-numpy
pkgver=1.23.5
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'pypy3')
optdepends=('openblas: faster linear algebra')
makedepends=('pypy3-setuptools' 'gcc-fortran' 'pypy3-cython')
options=('staticlibs')
source=("https://github.com/numpy/numpy/archive/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('57f2c02abd3031599faa0d5aa874e78c2a8ea36c5fa4c8811449f7eafa195921da2d369c882ec1832468fd6d087622b57c954a85544d81f04425b349e409dcff')

build() {
  cd numpy-$pkgver
  pypy3 setup.py build
}

package() {
  cd numpy-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/pypy3-numpy/

  install -d "$pkgdir"/usr/bin
  cd "$pkgdir/opt/pypy3/bin"
  for i in f2py f2py3 f2py3.$(python -V | cut -d. -f2); do
    mv $i "$pkgdir"/usr/bin/$i-pypy3
  done
}
