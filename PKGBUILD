# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=python2-awkward
_pkgname=awkward-array
pkgver=0.4.1
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
arch=('any')
makedepends=('python2-setuptools' 'python2-numpy')
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
options=(!emptydirs)
depends=('python2-numpy')
provides=('python2-awkward-array')
conflicts=('python2-awkward-array')

source=("https://github.com/scikit-hep/${_pkgname}/archive/${pkgver}.zip")
sha256sums=('757796dfc8198dab714fcf2d3be5ef2cffa550c1f109435690c107aef77197da')

prepare() {
  cd "${srcdir}"
  cd "${_pkgname}-${pkgver}"

  find . -name '*.py' -type f -exec \
      sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
          -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
          -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
          -i '{}' \; -print
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
  rm "${pkgdir}/usr/README.rst"

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
