# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.20.1
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('python-nose: testsuite'
            'openblas: faster linear algebra')
makedepends=('python-setuptools' 'gcc-fortran' 'python-nose' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz")
sha512sums=('bc8304d6c1da4281d3c5887cbc7eced22a25a029647e288be0e77370a3756e93c66b30b61d1482663815737ea1ba3a8fe3c59221460e12394ff10afb126f0339')

prepare() {
  # https://github.com/numpy/numpy/issues/17390
  sed -i '/error/a \    ignore:Module already imported so cannot be rewritten' numpy-$pkgver/pytest.ini
}

build() {
  cd numpy-$pkgver
  python setup.py build
}

check() {
  cd numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.9/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}
