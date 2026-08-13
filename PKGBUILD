# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=2.24.1
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
source=("git+${url}.git#tag=v${pkgver}"
        "lower_hatchling_version_requirements.patch"
        "clear_multiplexer_env_in_theme_tests.patch"
        "stabilize_click_chain_timing_in_word_drag_tests.patch")
sha256sums=('ea80ae215e476569f179c157928b6c7e475d30504495325c4b87b3e02911133e'
            'c9b417d8a6445bcca31f8d75757a7ec2d78e4b5aec784a7b5d2c9adf62106014'
            'f24330784d56591d197dc260166d29fff717fab763963fb2c7d8221f81135069'
            '635f8b81f8f884fd82a874372fe3aa466ec41380c48d4209b230afd34825bc3f')
prepare() {
    cd "$pkgname"
    cat "$srcdir/lower_hatchling_version_requirements.patch" | patch -p1
    cat "$srcdir/clear_multiplexer_env_in_theme_tests.patch" | patch -p1
    cat "$srcdir/stabilize_click_chain_timing_in_word_drag_tests.patch" | patch -p1
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
