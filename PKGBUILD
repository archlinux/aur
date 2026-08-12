# Contributor: Jacob S. Gordon <jacob.as.gordon@gmail.com
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=2.1.0
_pkgdir="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest python-pytest-timeout python-hypothesis)
source=("${_pkgdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('72016e2eebedaed9de851ebd879886ffd4a69f56b1818469b076f35e670a01452166fcbea1c71619df3b6e0495b615fb70ed7a76de8c42ee3a4884ff35000701')

build() {
    cd "${srcdir}/${_pkgdir}"
    export PYTHONHASHSEED=0
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgdir}"
    pytest
}

package() {
    cd ${pkgname}-${pkgver}
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" \
                       python -m installer \
                       --prefix=/usr --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}"
}
