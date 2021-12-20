# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy
pkgver=1.21.5
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
sha512sums=('dd9007bcf9bc93ea62ec0bacdf31b6f33159701463c2a4c8d4ba009c1b404a76e2d6ccd9c424b15820915f6265da95062c122035c66e18656eb990c3ac7df198')

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
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.10/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}
