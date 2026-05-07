# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=2.9.5
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
    "python-google-auth"
    "python-httpx"
    "python-jsonpatch"
    "python-linkify-it-py"
    "python-mcp"
    "python-mistralai"
    "python-opentelemetry-api"
    "python-opentelemetry-exporter-otlp"
    "python-opentelemetry-semantic-conventions"
    "python-packaging"
    "python-pexpect"
    "python-pydantic"
    "python-pydantic-settings"
    "python-pyperclip"
    "python-rich"
    "python-textual"
    "python-tomli-w"
    "python-tree-sitter-bash"
    "python-watchfiles"
    "python-yaml"
    "python-sounddevice"
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
sha256sums=('a6e3de661e99f13acecaa5ad609007d1bc070008b472b4d148b82d82517180cf')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    #export UV_PYTHON_PREFERENCE=only-system
    uv sync
    # Failing tests as of 2026-04-16:
    #tests/test_install_script.py::test_install_fails_when_vibe_not_in_uv_tool_dir
    #tests/test_install_script.py::test_install_reports_missing_path_for_uv_tool_bin
    #tests/snapshots/test_ui_snapshot_mcp_command.py::test_snapshot_mcp_overview
    #tests/snapshots/test_ui_snapshot_mcp_command.py::test_snapshot_mcp_overview_navigate_down
    uv run pytest --ignore=tests/test_install_script.py --ignore=tests/snapshots/test_ui_snapshot_mcp_command.py
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    echo "#!/usr/bin/env python3" > "${pkgdir}/usr/bin/vibe"
    pyver=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    cat "${pkgdir}/usr/lib/python${pyver}/site-packages/vibe/cli/entrypoint.py" >> "${pkgdir}/usr/bin/vibe"
    chmod 755 "${pkgdir}/usr/bin/vibe"
}
