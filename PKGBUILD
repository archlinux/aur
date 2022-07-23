# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

_pkgname=python-numpy
pkgname="${_pkgname}1.22"
pkgver=1.22.4
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('openblas: faster linear algebra')
makedepends=('python-setuptools' 'gcc-fortran' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
options=('staticlibs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('4415c6a96af625fcc7fe5395b1441c389fbe4a9b97b18e87ffa063609245f4b352e0b623f96bbacd3d0939fdc86fd79009bf09b1ee0004c13e3d05af298d8f10')

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
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/python-numpy/
}
