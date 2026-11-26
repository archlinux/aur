# Maintainer: devome <evinedeng@hotmail.com>

_reponame="Sciverse-Agent-Tools"
pkgname="sciverse"
pkgdesc="Sciverse Agent Tools — OpenAI / Anthropic / LangChain compatible tool schema and async client for Sciverse retrieval APIs"
pkgver=1.1.0
pkgrel=1
arch=('any')
url="https://github.com/opendatalab/${_reponame}"
license=('Apache-2.0')
depends=("python-httpx" "python-pydantic")
makedepends=("python-build" "python-hatchling" "python-installer")
checkdepends=("python-pytest" "python-pytest-asyncio" "python-respx")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-skill-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/web-skill.tgz")
sha256sums=('a63d87c508291eb3c9efcb57773b49fb6dcde331e4724bcbf80772569046362f'
            '8e5fa7c28a188113af8b64dd2702349c7608fd7899b2319d75f597be5f0adffa')

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
