# Contributor: Jacob S. Gordon <jacob.as.gordon@gmail.com
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=2.0.0
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
sha512sums=('4cb2d8cb3c70eb2cdc0957221f4a0f99e52831d62267195279e2772a76b97be29e2bf2dbfafa966a72ed3a2f6c548b77654c00b1a833c50c2dd64dd62270cd53')

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
