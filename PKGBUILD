# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot
_pkgbase=uproot
pkgname=('python2-uproot' 'python-uproot')
pkgver=3.2.3
pkgrel=1
pkgdesc="Minimalist CERN ROOT I/O in pure Python and Numpy"
arch=('any')
makedepends=('python2-setuptools' 'python2-numpy'
             'python-setuptools' 'python-numpy')
url="https://github.com/scikit-hep/uproot"
license=('BSD')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('451909c19226be2d73e129e6f074c4fee249fdc43603e6ee2f6b015a9ded0b45')

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
