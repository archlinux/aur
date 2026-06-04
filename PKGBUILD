# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-mcp
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc="KiCad MCP integrated with the KiCad IPC API."
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/Huaqiu-Electronics/kicad-mcp"
_pydeps=(
    # beautifulsoup4
    dotenv
    # httpx
    psutil
    typing_extensions

    # AUR
    # chromadb
    # langchain
    # langchain-community
    # langchain-core
    mcp
    typechat
    pynng
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'kicad-hq'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('6b2d7d0b1cedaf6a8551726a4ec9fbc15dd6aa8a631b4ce1a2fbc3523953a400')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
