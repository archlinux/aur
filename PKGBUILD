# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgbase=python-fastmcp
pkgname=(
    ${pkgbase}-remote
    ${pkgbase}-slim
    ${pkgbase}-tasks
    ${pkgbase}
)
_name=${pkgbase#python-}
pkgver=4.0.3
pkgrel=5
pkgdesc="The fast, Pythonic way to build MCP servers and clients."
arch=('any')
url='https://github.com/PrefectHQ/fastmcp'
license=('MIT')
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'python-uv-dynamic-versioning'
)
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('b0fc2ad48bc8d3f5ab282f0c5582ba100188f940ebd1aaf56c1d785e85990956')

build() {
    local dir
    for dir in . fastmcp_remote fastmcp_slim fastmcp_tasks; do
        ( cd "${srcdir}/${_name}/${dir}" && python -m build --wheel --no-isolation )
    done
}

package_python-fastmcp-slim() {
    pkgdesc="Dependency-slim FastMCP package (provides the fastmcp module)"
    depends=(
        'python'
        'python-mcp-types'
        'python-platformdirs'
        'python-pydantic'
        'python-pydantic-settings'
        'python-dotenv'
        'python-rich'
        'python-typing_extensions'
    )
    cd "${srcdir}/${_name}/fastmcp_slim"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_python-fastmcp-remote() {
    pkgdesc="Python stdio bridge for remote MCP servers, powered by FastMCP"
    depends=(
        'python'
        'python-fastmcp-slim'
    )
    cd "${srcdir}/${_name}/fastmcp_remote"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_python-fastmcp-tasks() {
    pkgdesc="Background task execution for FastMCP servers (SEP-2663)"
    depends=(
        'python'
        'python-cryptography'
        'python-fastmcp-slim'
        'python-pydocket'
    )
    cd "${srcdir}/${_name}/fastmcp_tasks"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_python-fastmcp() {
    pkgdesc="The fast, Pythonic way to build MCP servers and clients (meta package)"
    depends=(
        'python'
        'python-fastmcp-remote'
        'python-fastmcp-slim'
        'python-fastmcp-tasks'
    )
    cd "${srcdir}/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
