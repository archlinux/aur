# Maintainer: xia0er <xia0er@gmail.com>
# Contributor: Xyne <xyne@archlinux.ca>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel "angvp" Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python2-numpy-openblas
#pkgname=("python2-numpy-openblas" "python-numpy-openblas")
pkgname=python2-numpy-openblas
pkgver=1.10.0
pkgrel=1
pkgdesc="Scientific tools for Python - built with openblas"
arch=("i686" "x86_64")
license=("custom")
url="http://numpy.scipy.org/"
source=("python-numpy-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz") 

md5sums=('c8693369638ed9bff12a0c90ef8ea7af')

#package() {
#  package_python2-numpy-openblas
#}

prepare() {
  cp -a numpy{,-py2}-$pkgver
  cd numpy-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

package_python2-numpy-openblas() {
  depends=("python2" "cython2" "openblas-lapack")
  options=('staticlibs')
  makedepends=("python2-distribute" "gcc-fortran" "python2-nose")
  optdepends=("python2-nose: testsuite")
  provides=("python2-numpy=${pkgver}")
  conflicts=("python2-numpy")

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

package_python-numpy-openblas() {
  depends=("python" "cython" "openblas-lapack")
  options=('staticlibs')
  makedepends=("python-distribute" "gcc-fortran" "python-nose")
  optdepends=("python-nose: testsuite")
  provides=("python3-numpy=${pkgver}" "python-numpy=${pkgver}")
  conflicts=("python3-numpy" "python-numpy")

  _pyver=3.5
  _pyinc=3.5m

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

