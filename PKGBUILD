# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=2.21.0
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
    "python-humanize"
    "python-jsonpatch"
    "python-keyring"
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
    "python-sentry_sdk"
    "python-textual"
    "python-tomli-w"
    "python-tree-sitter-bash"
    "python-truststore"
    "python-watchfiles"
    "python-yaml"
    "python-zstandard"
    "python-sounddevice"
)
makedepends=(
    "python-build"
    "python-hatchling"
    "python-hatch-vcs"
    "python-installer"
)
checkdepends=(
    "pre-commit"
    "pyright"
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
source=(
  "git+${url}.git#tag=v${pkgver}" 
  "vibe_reduce_relayouts.patch::https://github.com/mistralai/mistral-vibe/compare/main...ikicic:mistral-vibe:reduce_relayouts.patch")
sha256sums=('8b957c961b379fb94bf17ce4974d24366284fa7fca421d897e4f72c1e01912f5'
            '126311122dfefdcf235f41a209d2606000741d1d1b7392e8264c74f55cd1d0d3')

prepare() {
    cd "$pkgname"
    # Upstream WIP (Ivica Kičić): reduce relayouts / CPU usage.
    patch -Np1 -i "../vibe_reduce_relayouts.patch"
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    uv sync
    # The build environment has no D-Bus session bus, so keyring's
    # SecretService backend blocks indefinitely on every lookup (e.g. during
    # ACP initialize and CLI onboarding), which times out the e2e and ACP
    # tests. Force a non-blocking in-memory backend.
    export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

    # These two tests exercise scripts/install.sh and assume no `uv`/`vibe`
    # binary in /usr/bin or /bin. They fail on a builder that already has
    # system-wide installs (which this package itself provides). Skip them.
    local deselect=(
        --deselect tests/test_install_script.py::test_install_reports_missing_path_for_uv_tool_bin
        --deselect tests/test_install_script.py::test_install_fails_when_vibe_not_in_uv_tool_dir
    )

    # Run test suite in parallel, skip deselected and any e2e tests.
    uv run pytest -n4 "${deselect[@]}" --ignore=tests/e2e
    
    # Run e2e tests serially (these fail too often in parallel).
    uv run pytest -n0 "${deselect[@]}" tests/e2e
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    echo "#!/usr/bin/env python3" > "${pkgdir}/usr/bin/vibe"
    pyver=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    cat "${pkgdir}/usr/lib/python${pyver}/site-packages/vibe/cli/entrypoint.py" >> "${pkgdir}/usr/bin/vibe"
    chmod 755 "${pkgdir}/usr/bin/vibe"
}
