# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgname=python2-awkward
_pkgname=awkward-array
pkgver=0.4.3
pkgrel=1
pkgdesc="Manipulate jagged, chunky, and/or bitmasked arrays as easily as Numpy"
arch=('any')
makedepends=('python2-setuptools' 'python2-numpy')
url="https://github.com/scikit-hep/awkward-array"
license=('BSD')
depends=('python2-numpy')
makedepends=('python2-pytest-runner' 'python2-setuptools')
checkdepends=('python2-h5py')
source=("${url}/archive/${pkgver}.zip")
sha256sums=('a3612477405fea2aea57294dc81e6f66ad0ba0ccd25cc54888bfff16f931d1f6')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

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

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py pytest
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
