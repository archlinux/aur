# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=obscura
pkgver=0.1.1
pkgrel=1
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
    'f6df978136f69d6964c2068ce70af556d259f7c3906e5bc6bcf8f66b284c03c3bcb385c18cbd163b2e6ba9f4ad065e681c03ddadcd96aa251d338bc371ef9ea6'
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
