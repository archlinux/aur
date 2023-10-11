# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=obscura
pkgver=0.1.0
pkgrel=2
pkgdesc='Symmetric file encryption using Argon2-based passphrases'
arch=('any')
url="https://github.com/jocke-l/${pkgname}"
license=('BSD')
depends=('python-cryptography' 'python-argon2-cffi')
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-hatch-fancy-pypi-readme'
)
checkdepends=('python-pytest')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    'no-hatch-vcs.diff'
)
sha512sums=(
    '5ddbdc8eaaae5cc2b5a89c6898278fd79df4d64dc8eb38a5da6fed2a0ee5bab88c765fccfcd1a566669189c02ccfcd5d699c0164332f39e108cd8288b33a7d6f'
    '3c26edde96c61e8e12570bbba67651520eb2e2ab25582cfb118f895d66aae5a49d985b47c14d5e3d3966e9c87d89ee7d963a707bb07931c37b5eb4dc96f2d642'
)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch pyproject.toml ../no-hatch-vcs.diff

}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    /usr/bin/python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    /usr/bin/pytest --no-cov
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
    /usr/bin/install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
