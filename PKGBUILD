# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy
pkgname=('python2-numpy' 'python-numpy')
pkgver=1.10.4
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.numpy.org/"
makedepends=('cblas' 'lapack' 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'gcc-fortran'
	'python-nose' 'python2-nose' 'cython' 'cython2')
options=('staticlibs')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz" 'site.cfg')
md5sums=('3cb325c3dff03b5bc15206c757a26116'
         '6ac5f9dac5d4c0e25a2eba6c98bf5b3c')

prepare() {
  cp site.cfg numpy-$pkgver
  cp -a numpy-$pkgver numpy-py2-$pkgver
  cd numpy-py2-$pkgver

  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  export LDFLAGS="$LDFLAGS -shared"

  echo "Building Python2"
  cd numpy-py2-$pkgver
  python2 setup.py config_fc --fcompiler=gnu95 build

  echo "Building Python3"
  cd ../numpy-$pkgver
  python setup.py config_fc --fcompiler=gnu95 build
}

package_python2-numpy() {
  depends=('lapack' 'python2' 'cblas')
  optdepends=('python2-nose: testsuite' 'atlas-lapack: for improved performance of some linear algebra operations')

  _pyver=2.7

  export ATLAS=None
  export LDFLAGS="$LDFLAGS -shared"

  cd numpy-py2-$pkgver
  python2 setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python2-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python2-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyver}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyver}/numpy"
}

package_python-numpy() {
  depends=('lapack' 'python' 'cblas')
  optdepends=('python-nose: testsuite' 'atlas-lapack: for improved performance of some linear algebra operations')
  provides=("python3-numpy=${pkgver}")
  replaces=('python3-numpy')
  conflicts=('python3-numpy')

  _pyver=3.5
  _pyinc=3.5m

  export ATLAS=None
  export LDFLAGS="$LDFLAGS -shared"

  cd numpy-$pkgver
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyinc}/numpy"
}
