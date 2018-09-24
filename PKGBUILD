# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot-methods
_pkgbase=uproot-methods
pkgname=('python2-uproot-methods' 'python-uproot-methods')
pkgver=0.1.1
pkgrel=1
pkgdesc="Pythonic mix-ins for ROOT classes"
arch=('any')
url="https://github.com/scikit-hep/uproot-methods"
license=('BSD')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('03bd102a16b1dbfb3fa6883734a1dffaeb2714a343d1bc2aa741d799bb5a5de2')

prepare() {
  cd "${srcdir}"
  cp -a "${_pkgbase}-${pkgver}" "${_pkgbase}-py2-${pkgver}"
  cd "${_pkgbase}-py2-${pkgver}"

  msg2 "Adjusting Python 2 shebangs..."
  find . -name '*.py' -type f -exec \
      sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
          -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
          -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
          -i '{}' \; -print
}

build_python2-uproot-methods() {
  makedepends=('python2-setuptools' 'python2-numpy')

  msg2 "Building Python2"
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"
  python2 setup.py build
}

build_python-uproot-methods() {
  makedepends=('python-setuptools' 'python-numpy')

  msg2 "Building Python3"
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build
}

package_python2-uproot-methods() {
  depends=('python2-numpy')
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # install -d "${pkgdir}/usr/share/doc/${pkgname}"
  # cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-uproot-methods() {
  depends=('python-numpy')
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # See FS#49651
  # install -d "${pkgdir}/usr/share/doc/${pkgname}"
  # cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
