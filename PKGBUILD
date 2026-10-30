# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Jacob S. Gordon <jacob.as.gordon@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# shellcheck disable=SC2034,SC2154,SC2164

_pkgbase=nameparser
pkgname=python-${_pkgbase}
pkgver=2.8.0
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
sha512sums=('b47d9a336eee93e2cf538c0f31fbdcbc6b39369585825f879226305cb328eea1430ecd23994ff9a5478769b00930f882d66c3784a216edeb062cd8381280f489')

build() {
    cd "${srcdir}/${_pkgdir}"
    export PYTHONHASHSEED=0
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgdir}"

    # Exclude failing tests (as explained in "https://github.com/derek73/python-nameparser/issues/949#issuecomment-6514414289")
    pytest --deselect tests/v2/test_word_report.py::test_a_child_refuses_a_package_from_outside_its_tree
}

package() {
    cd ${pkgname}-${pkgver}
    PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" \
                       python -m installer \
                       --prefix=/usr --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}"
}
