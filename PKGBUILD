# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=unstructured-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.31.6
pkgrel=1
pkgdesc="Python Client SDK for Unstructured API"
arch=('any')
url="https://github.com/Unstructured-IO/unstructured-python-client"
license=('MIT')
depends=(python-aiofiles python-cryptography python-dateutil python-eval-type-backport python-httpx python-nest-asyncio python-pydantic python-pypdf python-requests-toolbelt python-typing-inspection)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('75ccc248b0fbbabbb536bea13667e4b16b5a90353fe88a6d0a72d3e9d30c2de2')

prepare() {
    local authors="Unstructured"

    cd "${_pipname}-${pkgver}"
    sed -i "/\[tool.poetry\]/a\
authors = [\"${authors}\"]\n\
description = \"${pkgdesc}\"\n\
name = \"${_pkgname}\"\n\
version = \"${pkgver}\"" pyproject.toml
}

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -rf "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/py.typed"
    install -Dm644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
