# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=1.1.3
pkgrel=1
pkgdesc='Minimal CLI coding agent by Mistral'
arch=('x86_64')
url='https://github.com/mistralai/mistral-vibe'
license=(Apache-2.0)
depends=(
    "python"
    "python-agent-client-protocol"
    "python-aiofiles"
    "python-dotenv"
    "python-httpx"
    "python-linkify-it-py"
    "python-mcp"
    "python-mistralai"
    "python-packaging"
    "python-pexpect"
    "python-pydantic"
    "python-pydantic-settings"
    "python-pyperclip"
    "python-textual"
    "python-tomli-w"
    "python-watchfiles"
    "python-rich"
)
makedepends=(
    "pre-commit"
    "pyright"
    "python-build"
    "python-hatchling"
    "python-hatch-vcs"
    "python-installer"    
    "python-pytest"
    "python-pytest-asyncio"
    "python-pytest-textual-snapshot"
    "python-pytest-timeout"
    "python-pytest-xdist"
    "python-respx"
    "ruff"
    "twine"
    "typos"
    "uv"
    "vulture"
)
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('0b88e877560b2c51ccd855529391a3832b72ed154780002f00d46876481b4265')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    #export UV_PYTHON_PREFERENCE=only-system
    uv sync
    uv run pytest
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    echo "#!/usr/bin/env python3" > "${pkgdir}/usr/bin/vibe"
    pyver=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    cat "${pkgdir}/usr/lib/python${pyver}/site-packages/vibe/cli/entrypoint.py" >> "${pkgdir}/usr/bin/vibe"
    chmod 755 "${pkgdir}/usr/bin/vibe"
}
