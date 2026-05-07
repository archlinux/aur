# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dbgprobe-mcp-server
_name=${pkgname#python-}
pkgver=0.1.4
pkgrel=1
pkgdesc="Model Context Protocol (MCP) server that lets AI agents interact with on-chip debug probes (J-Link, CMSIS-DAP, ST-Link, etc.)"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/es617/dbgprobe-mcp-server"
_pydeps=(
    anyio
    pyelftools
    yaml

    # AUR
    cmsis-svd
    mcp
)
depends=(
    'python'
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'git'
    'python-hatch-vcs'
    'python-hatchling'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
    'openocd: Debugging, in-system programming and boundary-scan testing for embedded target devices'
    'stlink: Open source STM32 MCU programming toolset'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('42e0d1acff225037d4f4235b7f65fb94c18ba340fa96590568dd7ccdedccb7bf')

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
    install -vDm0644 README.* -t ${pkgdir}/usr/share/doc/${pkgname}/
    cp -rv docs ${pkgdir}/usr/share/doc/${pkgname}/
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
