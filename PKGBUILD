# Maintainer: Jesse R Codling <codling@umich.edu>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy-flame
pkgver=1.23.1
pkgrel=1
pkgdesc="Scientific tools for Python, compiled with libFLAME"
arch=('x86_64')
license=('custom')
url="https://www.numpy.org/"
depends=('cblas' 'libflame' 'python')
provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
conflicts=("python3-numpy" "python-numpy")
makedepends=('python-setuptools' 'gcc-fortran' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
options=('staticlibs')
source=("https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha512sums=('b34fb627e0e548bae3cf4555c4c71ab4a170ade86a9ff4011a5dfac6aba29e2e04b1151b9364cd1efff004efc1c04b3bab111facbcdc3297f8c38d7a09c83e17')

# very minimal changes from the upstream python-numpy PKGBUILD. All I did was add the exports to specify libFLAME.
build() {
  cd numpy-$pkgver
  export ATLAS=None
  export NPY_LAPACK_ORDER='flame,lapack'
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
