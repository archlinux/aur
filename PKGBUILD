# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot-methods
_pkgbase=uproot-methods
pkgname=('python2-uproot-methods' 'python-uproot-methods')
pkgver=0.2.6
pkgrel=1
pkgdesc="Pythonic mix-ins for ROOT classes"
arch=('any')
makedepends=('python2-setuptools' 'python2-numpy'
             'python-setuptools' 'python-numpy')
url="https://github.com/scikit-hep/uproot-methods"
license=('BSD')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('06e60a3b66d650d0ceceaa392ca2f7d1ecd9a9f5b4b07aa7e3700a9e0b47c1d9')

prepare() {
  cd "${srcdir}"
  cp -a "${_pkgbase}-${pkgver}" "${_pkgbase}-py2-${pkgver}"
  cd "${_pkgbase}-py2-${pkgver}"

  find . -name '*.py' -type f -exec \
      sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
          -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
          -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
          -i '{}' \; -print
}

build() {
  msg2 "Building Python3"
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build

  msg2 "Building Python2"
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"
  python2 setup.py build
}

package_python2-uproot-methods() {
  depends=('python2-awkward'
           'python2-numpy')
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # upstream has no docs
  # install -d "${pkgdir}/usr/share/doc/${pkgname}"
  # cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-uproot-methods() {
  depends=('python-awkward'
           'python-numpy')
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # See FS#49651
  # upstream has no docs
  # install -d "${pkgdir}/usr/share/doc/${pkgname}"
  # cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
