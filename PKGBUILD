# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot
_pkgbase=uproot
pkgname=('python2-uproot' 'python-uproot')
pkgver=2.9.0
pkgrel=3
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
url="https://github.com/scikit-hep/uproot"
license=('BSD')
# makedepends=('python2-setuptools' 'python-setuptools')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('352d21d99e5f469086bbb5a1d516a9ebba5b322abdd5235be42c6d80d650beae')

prepare() {
  cd "${srcdir}"
  cp -a "uproot-${pkgver}" "uproot-py2-${pkgver}"
  cd "uproot-py2-${pkgver}"

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
  cd "${srcdir}/uproot-py2-${pkgver}"
  python2 setup.py build
}

build_python-uproot() {
  makedepends=('python-setuptools' 'python-numpy')

  msg2 "Building Python3"
  cd "${srcdir}/uproot-${pkgver}"
  python setup.py build
}

package_python2-uproot() {
  depends=('python2-numpy')
  optdepends=('python2-futures: Python2 parallel processing'
              'python2-lz4: compression used by some ROOT files'
              'xrootd: access remote files over XRootD'
              'xz: compression used by some ROOT files')
  cd "${srcdir}/uproot-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-uproot() {
  depends=('python-numpy')
  optdepends=('python-lz4: compression used by some ROOT files'
              'xrootd: access remote files over XRootD')
  cd "${srcdir}/uproot-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # See FS#49651
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
