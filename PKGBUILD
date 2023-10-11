# Maintainer: Joakim Saario <saario.joakim@gmail.com>

_pkgname=argon2-cffi
pkgname=python-argon2-cffi
pkgver=23.1.0
pkgrel=1
pkgdesc='Secure Password Hashes for Python '
arch=('any')
url="https://github.com/hynek/${_pkgname}"
license=('MIT')
depends=('python-argon2-cffi-bindings')
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-hatch-fancy-pypi-readme'
)
checkdepends=('python-pytest')
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    'no-hatch-vcs.diff'
)
sha512sums=(
    'bac891e7c47be99723e7ce388d972464ef7364d8e5d3001df915071686da1d9e893200e15b162643d4f1c6f489c14c0c3093fee1f1bbaac3b3c156b6a4feb87d'
    '95a14ec38da6c6d74b4e78514fb035f9ec76f2b93723f21f705a594c60932d14d32cb7ad3ebef0c04cd748ca048fa29fa5ad9b8bbc615d65de82807c06f1269c'
)

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch pyproject.toml ../no-hatch-vcs.diff
    rm -f tests/test_packaging.py

}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    /usr/bin/python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    export PYTHONPATH=src/
    /usr/bin/pytest
    /usr/bin/python -m argon2 -n 1 -t 1 -m 8 -p 1
    /usr/bin/python -m argon2 --profile CHEAPEST
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    /usr/bin/install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
