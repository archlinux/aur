#  Maintainer: Jacob S. Gordon <jacob.as.gordon@gmail.com
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=1.2.1
_pkgdir="${pkgname}-${pkgver}"
pkgrel=1
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-wheel
             python-setuptools python-pytest)
source=("${_pkgdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2ab7e4c8eb77bdf96842ddac36af3196ada578e08908b66ead85a600d88e5d2f3141c2914d4017379cc4ca1c691f88d05d00fbe06cb7732b806cb0d9db228d30')

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
