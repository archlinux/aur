# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.18.0
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('python-nose: testsuite'
            'openblas: faster linear algebra')
makedepends=('python-setuptools' 'gcc-fortran' 'python-nose' 'cython')
checkdepends=('python-pytest')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz")
sha512sums=('96c97c21d611c613466f14105db12258d220b214cf14bcbc9eca1d0bd6b6c353a7eb3cece79656780f53a3be5e04f98621f8f3404cb78e841852e5845f11edfe')

build() {
  cd numpy-$pkgver
  python setup.py build
}

check() {
  # TODO: Fix fortran tests here (it works fine after installation)

  cd numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.8/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}
