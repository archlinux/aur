# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python2-numpy-openblas
#pkgname=("python2-numpy-openblas" "python-numpy-openblas")
pkgname=python2-numpy-openblas
pkgver=1.13.0
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.scipy.org/"
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz") 
sha512sums=('f95108f6e3319b3a1e9fc18af59e04ed55b434a1b5fff7b13207c24e9002d5adfa4046dc0cc3d8f13957fa4e2a18b932bc41347fa1aeddd12ef6598861670c83')

depends=("python2" "cython2" "openblas-lapack")
options=('staticlibs')
makedepends=("python2-distribute" "gcc-fortran" "python2-nose")
optdepends=("python2-nose: testsuite")
provides=("python2-numpy=${pkgver}")
conflicts=("python2-numpy")

prepare() {
  cp -a numpy{,-py2}-$pkgver
  cd numpy-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

package() {
  _pyver=2.7

  export Atlas=None
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd "${srcdir}"/numpy-py2-"$pkgver"

  #python2 setup.py config_fc --fcompiler=gnu95 config
  python2 setup.py config_fc --fcompiler=gnu95 build

  python2 setup.py config_fc --fcompiler=gnu95 install \
    --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyver}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyver}/numpy"

}

