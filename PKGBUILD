# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-awkward-array
_pkgbase=awkward-array
pkgname=('python2-awkward-array' 'python-awkward-array')
pkgver=0.2.0
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
arch=('any')
makedepends=('python2-setuptools' 'python2-numpy'
             'python-setuptools' 'python-numpy')
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
options=(!emptydirs)

source=("https://github.com/scikit-hep/${_pkgbase}/archive/${pkgver}.zip")
sha256sums=('853fc76147fc3543428978dcbe895298581d02b4b242682ab3a8e99b9feb9b39')

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

build() {
  msg2 "Building Python3"
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py build

  msg2 "Building Python2"
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"
  python2 setup.py build
}

package_python2-awkward-array() {
  depends=('python2-numpy')
  optdepends=('python2-arrow: interoperability with other applications and fast Parquet reading/writing'
              'python2-bcolz: on-the-fly compression'
              'python2-dask: distribute work on arrays'
              'python2-numba: JIT-compile functions')
  cd "${srcdir}/${_pkgbase}-py2-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}

package_python-awkward-array() {
  depends=('python-numpy')
  optdepends=('python-arrow: interoperability with other applications and fast Parquet reading/writing'
              'python-bcolz: on-the-fly compression'
              'python-dask: distribute work on arrays'
              'python-numba: JIT-compile functions')
  cd "${srcdir}/${_pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  # See FS#49651
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
