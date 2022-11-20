# Maintainer: Jesse R Codling <codling@umich.edu>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgname=python-numpy-flame
pkgver=1.23.5
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
sha256sums=('1b1766d6f397c18153d40015ddfc79ddb715cabadc04d2d228d4e5a8bc4ded1a')

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
