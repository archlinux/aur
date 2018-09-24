# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot
_pkgbase=uproot
pkgname=('python2-uproot' 'python-uproot')
pkgver=3.0.2
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
url="https://github.com/scikit-hep/uproot"
license=('BSD')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('673213b05f116bfd67506c3657a789bdd835086618dce5f265eff9804c064daa')

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

build_python2-uproot() {
  makedepends=('python2-setuptools' 'python2-numpy')

  msg2 "Building Python2"
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"
  python2 setup.py build
}

build_python-uproot() {
  makedepends=('python-setuptools' 'python-numpy')

  msg2 "Building Python3"
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build
}

package_python2-uproot() {
  depends=('python2-awkward-array'
           'python2-cachetools'
           'python2-lz4'
           'python2-numpy'
           'python2-uproot-methods')
  optdepends=('python2-futures: Python2 parallel processing'
              'python2-backports.lzma: LZMA compression used by some ROOT files'
              'xrootd: access remote files over XRootD')
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-uproot() {
  depends=('python-awkward-array'
           'python-cachetools'
           'python-lz4'
           'python-numpy'
           'python-uproot-methods')
  optdepends=('xrootd: access remote files over XRootD')
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # See FS#49651
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
