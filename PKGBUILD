# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Jacob S. Gordon <jacob.as.gordon@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=2.6.0
_pkgdir="${pkgname}-${pkgver}"
pkgrel=2
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest python-pytest-xdist python-pytest-timeout python-hypothesis)
source=("${_pkgdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('90aa4dd302c80760f0df754b80349e616f79f10af6af0a85207ecb9d19dc99a7543bb5f4497e2cc00b1e68e96929ec4ecfeec4d04f2ad6f31bf425e7705b4c5f')

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
