# Maintainer: Joakim Saario <saario.joakim@gmail.com>

pkgname=obscura
pkgver=0.1.0
pkgrel=1
pkgdesc='Symmetric file encryption using Argon2-based passphrases'
arch=('any')
url="https://github.com/jocke-l/${pkgname}"
license=('BSD')
depends=('python-cryptography' 'python-argon2-cffi')
makedepends=('python-build'  'python-installer'  'python-hatchling')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('5ddbdc8eaaae5cc2b5a89c6898278fd79df4d64dc8eb38a5da6fed2a0ee5bab88c765fccfcd1a566669189c02ccfcd5d699c0164332f39e108cd8288b33a7d6f')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    sed -i 's#\(requires = \).*#\1 ["hatchling"]#' pyproject.toml
    sed -i "s#dynamic.*#version = \"${pkgver}\"\nreadme = \"READMD.md\"#" pyproject.toml

    awk -v RS= -v ORS='\n\n' '$1 != "[tool.hatch.version]"' \
        pyproject.toml > pyproject.toml
    awk -v RS= -v ORS='\n\n' '$1 != "[tool.hatch.metadata.hooks.fancy-pypi-readme]"' \
        pyproject.toml > pyproject.toml
    awk -v RS= -v ORS='\n\n' \
        '$1 != "[[tool.hatch.metadata.hooks.fancy-pypi-readme.fragments]]"' \
        pyproject.toml > pyproject.toml
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    /usr/bin/python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    PYTHONPATH="src:$PYTHONPATH" /usr/bin/pytest -c /dev/null
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl .
    /usr/bin/install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
