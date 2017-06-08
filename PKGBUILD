# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 

pkgbase=python-numpy
pkgname=('python2-numpy' 'python-numpy')
pkgver=1.13.0
pkgrel=1
pkgdesc="Scientific tools for Python"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.numpy.org/"
makedepends=('cblas' 'lapack' 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'gcc-fortran'
	'python-nose' 'python2-nose' 'cython' 'cython2')
options=('staticlibs')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/numpy/numpy/archive/v$pkgver.tar.gz" 'site.cfg')
sha512sums=('f95108f6e3319b3a1e9fc18af59e04ed55b434a1b5fff7b13207c24e9002d5adfa4046dc0cc3d8f13957fa4e2a18b932bc41347fa1aeddd12ef6598861670c83'
            '03a0f161be4963625f110a26167efbd300a12bd4cf99c8250c47ac865466d03fc8640e7e4fb6a59c39bf8b797609f5ed50afbc720d1fcbd2c4c57263cf8b406b')

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
  optdepends=('python2-nose: testsuite')

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
  optdepends=('python-nose: testsuite')
  provides=("python3-numpy=${pkgver}")
  replaces=('python3-numpy')
  conflicts=('python3-numpy')

  _pyver=3.6
  _pyinc=3.6m

  export ATLAS=None
  export LDFLAGS="$LDFLAGS -shared"

  cd numpy-$pkgver
  python setup.py config_fc --fcompiler=gnu95 install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"

  install -m755 -d "${pkgdir}/usr/include/python${_pyinc}"
  ln -sf /usr/lib/python${_pyver}/site-packages/numpy/core/include/numpy "${pkgdir}/usr/include/python${_pyinc}/numpy"
}
