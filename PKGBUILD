# Maintainer: devome <evinedeng@hotmail.com>

_reponame="Sciverse-Agent-Tools"
pkgname="sciverse"
pkgdesc="Sciverse Agent Tools — OpenAI / Anthropic / LangChain compatible tool schema and async client for Sciverse retrieval APIs"
pkgver=0.15.1
pkgrel=1
arch=('any')
url="https://github.com/opendatalab/${_reponame}"
license=('Apache-2.0')
depends=("python-httpx" "python-pydantic")
makedepends=("python-build" "python-hatchling" "python-installer")
checkdepends=("python-pytest" "python-pytest-asyncio" "python-respx")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-skill-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/web-skill.tgz")
sha256sums=('3972131ffa7d018ccff54d3c205f3683406bc47746139e2ffdc9294d808ea394'
            '2f47052fc4961353d7f600fd752333300cd99735e309594ddd2fb57bea1b5b7d')

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
