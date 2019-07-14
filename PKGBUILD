# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pyname=xxhash
pkgname=python2-${_pyname}
_pkgname=python-${_pyname}
pkgver=1.3.0
pkgrel=2
pkgdesc='Python2 binding for xxHash'
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/${_pyname}/"
depends=('python2')
makedepends=('git' 'python2-setuptools')
license=('BSD')
source=("python2-xxhash-${pkgver}::git+https://github.com/ifduyue/python-${_pyname}/#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}

    # pull xxhash source
    git submodule update --init --recursive

    # only needed for python2
    find . -name '*.py' -type f -exec \
        sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
            -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
            -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
            -i '{}' \; -print
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python2 setup.py build
}

check() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python2 setup.py test
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
