# Maintainer: devome <evinedeng@hotmail.com>

_reponame="Sciverse-Agent-Tools"
pkgname="sciverse"
pkgdesc="Sciverse Agent Tools — OpenAI / Anthropic / LangChain compatible tool schema and async client for Sciverse retrieval APIs"
pkgver=1.1.1
pkgrel=1
arch=('any')
url="https://github.com/opendatalab/${_reponame}"
license=('Apache-2.0')
depends=("python-httpx" "python-pydantic")
makedepends=("python-build" "python-hatchling" "python-installer")
checkdepends=("python-pytest" "python-pytest-asyncio" "python-respx")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-skill-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/web-skill.tgz")
sha256sums=('984e9b6e689003aa75b6e1690009c7c55047cc0e031f482a3e1bcac6ea585e08'
            '7a70b7cc9fd62c3aadbe172c7a4288f0ab9ae845af4a8e10ca3e650f39ec22af')

build() {
    cd "${_reponame}-${pkgver}/packages/python"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd "${_reponame}-${pkgver}/packages/python"
    python -m installer --destdir="tmp_install" dist/*.whl

    export PYTHONPATH="$PWD/tmp_install$_site_packages/:$PYTHONPATH:$PWD/tests"
    pytest -vv
}

package() {
    cd "${_reponame}-${pkgver}/packages/python"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    cd "${srcdir}/.well-known/agent-skills/${pkgname}"
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
