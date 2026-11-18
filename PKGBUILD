# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Jacob S. Gordon <jacob.as.gordon@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164

_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=3.1.0
pkgrel=1
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL-2.1-or-later)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest python-pytest-xdist python-pytest-timeout python-hypothesis)

_pkgdir="${pkgname}-${pkgver}"
source=("${_pkgdir}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4079b3ff99b0fb353dba5026d41b88543966215d36b203db9a7c825ca861a082dfd5a3de135a8abd0384b152c63846779e30f12471e842e59b974fa6eb53d199')

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

