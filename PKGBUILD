# Maintainer: Konstantin Gizdov <arch at kge dot pw>

pkgbase=python-uproot-methods
_pkgbase=uproot-methods
pkgname=('python2-uproot-methods' 'python-uproot-methods')
pkgver=0.7.0
pkgrel=1
pkgdesc="Pythonic mix-ins for ROOT classes"
arch=('any')
makedepends=('python2-setuptools' 'python2-awkward' 'python2-numpy'
             'python-setuptools' 'python-awkward' 'python-numpy')
url="https://github.com/scikit-hep/uproot-methods"
license=('BSD')

source=("${url}/archive/${pkgver}.zip")
sha256sums=('ecd83aa88209ea99dab8c8158d1c61ca8c65ed3d8bb3b5a9acfe31f2a5712cc0')

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
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_pkgbase}-py2-${pkgver}"
    python2 setup.py build
}

check() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py test

    cd "${srcdir}/${_pkgbase}-py2-${pkgver}"
    python2 setup.py test
}

package_python2-uproot-methods() {
    depends=('python2-awkward' 'python2-numpy')
    cd "${srcdir}/${_pkgbase}-py2-${pkgver}"

    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
}

package_python-uproot-methods() {
    depends=('python-awkward' 'python-numpy')
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    python setup.py install --root="${pkgdir}/" --optimize=1

    install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D README.rst "${pkgdir}/usr/share/${pkgname}/README.rst"
}
