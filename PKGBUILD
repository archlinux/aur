# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy-openblas
#pkgname=("python2-numpy-openblas" "python-numpy-openblas")
pkgname=python-numpy-openblas
pkgver=1.13.1
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.scipy.org/"
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz") 
sha512sums=('98102998cd5abafb8c89c98c37cc1ec1228c02f8e6295c4945cb0ecc6a04e32289ed0853b3bac4f7319d3aa7b9bc854e7ad0c1de36435b1d676bad79a74a1ec6')

depends=("python" "cython" "openblas-lapack")
options=('staticlibs')
makedepends=("python-distribute" "gcc-fortran" "python-nose")
optdepends=("python-nose: testsuite")
provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
conflicts=("python3-numpy" "python-numpy")

package() {
  _pyver=3.6
  _pyinc=3.6m

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python3"
  cd "$srcdir/numpy-$pkgver"

  #python setup.py config_fc --fcompiler=gnu95 config
  python setup.py config_fc --fcompiler=gnu95 build

  python setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyinc}/numpy"

}

