# Maintainer: enihcam <enihcam@noreply.gitcode.com>
pkgname=openjiuwen-connect
pkgver=0.1.8
pkgrel=1
pkgdesc="OpenJiuwen Connect: channel adapters (Telegram, Slack, etc.) + MCP server. Ships as a venv at /opt/openjiuwen-connect."
arch=('x86_64')
url="https://gitcode.com/openJiuwen/agent-studio"
license=('Apache-2.0')
depends=(
    'python>=3.11.4'
    'python-virtualenv'
    'python-pip'
    'python-click'        # transitive of the channel adapters
    # Channel adapters / MCP server runtime deps (namcap requires these to be
    # declared even though the bundled venv ships the pip-installed copies):
    'python-certifi'
    'python-charset-normalizer'
    'python-cryptography'
    'python-dotenv'
    'python-idna'
    'python-legacy-cgi'   # transitive: stdlib `cgi` was removed in Python 3.13
    'python-numpy'
    'python-requests'
    'python-urllib3'
    'python-yaml'
)
makedepends=('python-pip')
optdepends=(
    'openjiuwen-server: backend that the channel adapters and MCP server proxy to'
)
_srcdir_repo=agent-studio
source=("git+https://gitcode.com/openJiuwen/agent-studio.git#tag=v${pkgver}")
source+=("openjiuwen-channel-runner")
source+=("openjiuwen-mcp-server")
source+=("openjiuwen-connect.install")
sha256sums=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')
sha256sums+=('SKIP')

# Notes:
# - The upstream connect/ tree has no pyproject.toml, so we cannot build a wheel.
#   We install it into a venv at /opt/openjiuwen-connect/venv/ alongside the
#   adapter deps listed in connect/adapters/*/requirements.txt.
# - This is intentionally not split into per-channel subpackages because the
#   upstream tree couples them under one umbrella and most users want both.

build() {
    local srcdir_top="${srcdir}/${_srcdir_repo:-agent-studio}"
    local venv="${srcdir}/venv"

    python -m venv --system-site-packages "${venv}"
    "${venv}/bin/pip" install --no-cache-dir --upgrade pip wheel

    # Merge requirements from each adapter subpackage, then install once.
    local merged="${srcdir}/requirements-merged.txt"
    : > "${merged}"
    for req in "${srcdir_top}"/connect/adapters/*/requirements.txt; do
        [ -f "${req}" ] || continue
        echo "# --- ${req##*/connect/} ---" >> "${merged}"
        grep -vE '^\s*(#|$)' "${req}" >> "${merged}" || true
    done
    "${venv}/bin/pip" install --no-cache-dir -r "${merged}"
}

package() {
    local srcdir_top="${srcdir}/${_srcdir_repo:-agent-studio}"

    # Install the venv (built in build()) under /usr/lib/ — namcap forbids ELF
    # files under /opt/, and the venv bundles .so extensions (pydantic_core,
    # aiohttp, frozenlist, yarl, rpds, propcache, multidict, audioop, etc.).
    install -dm755 "${pkgdir}/usr/lib/openjiuwen-connect"
    cp -a "${srcdir}/venv" "${pkgdir}/usr/lib/openjiuwen-connect/venv"

    # Lay out the connect/ source tree under /usr/share/ (FHS read-only data).
    install -dm755 "${pkgdir}/usr/share/openjiuwen-connect"
    cp -a "${srcdir_top}/connect/." "${pkgdir}/usr/share/openjiuwen-connect/src/"

    # Wrapper scripts in /usr/bin/
    install -Dm755 "${srcdir}/openjiuwen-channel-runner" \
        "${pkgdir}/usr/bin/openjiuwen-channel-runner"
    install -Dm755 "${srcdir}/openjiuwen-mcp-server" \
        "${pkgdir}/usr/bin/openjiuwen-mcp-server"

    # Sample configuration directory (user copies/adapts)
    install -dm755 "${pkgdir}/etc/openjiuwen-connect"
    install -Dm644 /dev/null "${pkgdir}/etc/openjiuwen-connect/.keepdir"

    # License
    install -Dm644 "${srcdir_top}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install hook (notes how to activate)
    install -Dm755 "${srcdir}/openjiuwen-connect.install" \
        "${pkgdir}/usr/share/libalpm/scripts/openjiuwen-connect.install"
}