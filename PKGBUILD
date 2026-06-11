#  Maintainer: Jacob S. Gordon <jacob.as.gordon@gmail.com
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=1.2.0
_pkgdir="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-wheel)
source=("${_pkgdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ae81e17c679628c426d9a54691b92d524a032ccc759f76783c89f541b0db6a9fdcd0638e37d9188cbbc12512a16a7d8d43f1907ea866ff893db1db96ffec33f9')

build() {
    cd "${srcdir}/${_pkgdir}"
    export PYTHONHASHSEED=0
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgdir}"
    python tests.py
}

package() {
    cd ${pkgname}-${pkgver}
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" \
                       python -m installer \
                       --prefix=/usr --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}"
}
