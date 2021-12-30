# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgname="python-numpy-openblas"
pkgver=1.21.5
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.org/"
depends=("python" "cython" "openblas-lapack")
optdepends=("python-nose: testsuite")
provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
conflicts=("python3-numpy" "python-numpy")
makedepends=('cblas' 'lapack' 'python' 'python-setuptools' 'gcc-fortran' 'python-nose' 'cython' 'python-hypothesis')
checkdepends=('python-pytest')
options=('staticlibs')
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/releases/download/v$pkgver/numpy-$pkgver.tar.gz")
sha256sums=('1a7ee0ffb35dc7489aebe5185a483f4c43b0d2cf784c3c9940f975a7dde56506')

prepare() {
  # https://github.com/numpy/numpy/issues/17390
  sed -i '/error/a \    ignore:Module already imported so cannot be rewritten' numpy-$pkgver/pytest.ini
}

build() {
  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  cd numpy-$pkgver

  python setup.py config_fc --fcompiler=gnu95 build
}

check() {
  cd numpy-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.9/site-packages:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd numpy-$pkgver

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}

