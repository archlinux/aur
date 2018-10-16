# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-root_numpy
_pkgbase=root_numpy
pkgname=('python2-root_numpy' 'python-root_numpy')
pkgver=4.7.3
pkgrel=2
pkgdesc="The interface between ROOT and NumPy"
arch=('i686' 'x86_64')
url="http://scikit-hep.org/root_numpy/"
license=('BSD')
makedepends=('python2-setuptools' 'python-setuptools' 'cython2' 'cython'
             'python2-numpy' 'python-numpy' 'root')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('62f467ffad6608566c943b8dffea212e12caccc96155e81ba451a1034adf1f33')

prepare() {
  cd "${srcdir}"
  cp -a "root_numpy-${pkgver}" "root_numpy-py2-${pkgver}"
  cd "root_numpy-py2-${pkgver}"

  find . -name '*.py' -type f -exec \
      sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
          -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
          -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
          -i '{}' \; -print
}

build() {
  msg2 "Building Python2"
  cd "${srcdir}/root_numpy-py2-${pkgver}"
  python2 setup.py build

  msg2 "Building Python3"
  cd "${srcdir}/root_numpy-${pkgver}"
  python setup.py build
}

package_python2-root_numpy() {
  depends=('python2-numpy' 'root')
  cd "${srcdir}/root_numpy-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r benchmarks "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r paper "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-root_numpy() {
  depends=('python-numpy' 'root')
  cd "${srcdir}/root_numpy-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r benchmarks "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -r paper "${pkgdir}/usr/share/doc/${pkgname}/"
}
