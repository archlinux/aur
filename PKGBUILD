# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgname="python-numpy-openblas"
pkgver=1.18.0
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.scipy.org/"
depends=("python" "cython" "openblas-lapack")
optdepends=("python-nose: testsuite")
provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
conflicts=("python3-numpy" "python-numpy")
makedepends=('cblas' 'lapack' 'python' 'python-setuptools' 'gcc-fortran' 'python-nose' 'cython')
checkdepends=('python-pytest')
options=('staticlibs')
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha256sums=('e5eaf340489b76eef91352bf48b36e92ace07f6b0f1c87dcd3b5dbada97df03a')

build() {
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python3"
  cd numpy-$pkgver

  python setup.py config_fc --fcompiler=gnu95 build
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

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}

