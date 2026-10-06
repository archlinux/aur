# Maintainer: Robin Trioux <robin@trioux.eu>
# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=2.26.0
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
    "python-giturlparse"
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
    "python-rfc8785"
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
    "python-croniter"
)
# Upstream switched from hatchling to a custom maturin-based build backend in
# v2.25.8: building the wheel now also compiles the Rust harness extension and
# the vibe-rs TUI, and links the Linux build with the zig cc shim. `uv build`
# resolves the PEP 517 build requirements (maturin, ziglang) itself; rustc and
# cargo come from the system toolchain.
makedepends=(
    "uv"
    "rust>=1.97"
    "python-installer"
)
checkdepends=(
    "uv"
)
source=("git+${url}.git#tag=v${pkgver}"
        "clear_multiplexer_env_in_theme_tests.patch"
        "stabilize_click_chain_timing_in_word_drag_tests.patch"
        "stretch_e2e_timeouts_when_builder_is_loaded.patch")
sha256sums=('SKIP'
            'f24330784d56591d197dc260166d29fff717fab763963fb2c7d8221f81135069'
            'ec15c34e133eb3ca09c593ac03a715beb30557585d81b0ac99bffcf5818bd5e2'
            '2706769c69b63715757f2d820b4b3d9c363a278821d58c29fdd5ecf25fb720c9')

prepare() {
    cd "$pkgname"
    cat "$srcdir/clear_multiplexer_env_in_theme_tests.patch" | patch -p1
    cat "$srcdir/stabilize_click_chain_timing_in_word_drag_tests.patch" | patch -p1
    cat "$srcdir/stretch_e2e_timeouts_when_builder_is_loaded.patch" | patch -p1
}

build() {
    cd "$pkgname"
    # Match the official Linux wheels from upstream release.yml: the voice
    # feature (cpal -> ALSA) is disabled there. CARGO_BUILD_FLAGS is read by
    # the upstream build backend (build_backend/maturin_backend.py,
    # _stage_rust_cli) and forwarded to cargo.
    export CARGO_BUILD_FLAGS="--no-default-features"

    # The native C archives built by onig_sys / aws-lc-sys get linked into
    # vibe-rs. Two user-environment things break that final link with
    # "undefined symbol: onig_* / aws_lc_*" errors, so neutralize both:
    #
    # Rust 1.90 (2025-08) made lld the default linker on x86_64 Linux via the
    # "lld" linker feature. The bundled rust-lld fails to link the native
    # static archives produced by the onig_sys / aws-lc-sys build scripts
    # (undefined onig_* / aws_lc_* symbols), a widely reported 1.90
    # regression. Note: -C link-self-contained=-linker is NOT the right fix
    # here — it only drops the bundled gcc-ld shims while keeping
    # -fuse-ld=lld, so cc then looks for a system ld.lld that Arch does not
    # ship ("collect2: cannot find 'ld'"). The stabilized opt-out below
    # disables the lld feature entirely so cc links with ld.bfd, as upstream
    # CI did before 1.90.
    export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }-C linker-features=-lld"

    local _uv
    _uv="$(command -v uv)"
    export PATH="/usr/local/bin:/usr/bin:/bin"
    unset RUSTC RUSTDOCFLAGS RUSTUP_HOME RUSTUP_TOOLCHAIN
    export CARGO_HOME="${srcdir}/cargo-home"
    mkdir -p "$CARGO_HOME"
    CFLAGS="$(sed -E 's/-flto(=[^ ]+)?//g' <<<"$CFLAGS")"
    CXXFLAGS="$(sed -E 's/-flto(=[^ ]+)?//g' <<<"$CXXFLAGS")"
    LDFLAGS="$(sed -E 's/-flto(=[^ ]+)?//g' <<<"$LDFLAGS")"
    export CFLAGS CXXFLAGS LDFLAGS
    "$_uv" build --wheel --python /usr/bin/python3 --out-dir dist
}

check() {
    cd "$pkgname"
    uv sync
    # The build environment has no D-Bus session bus, so keyring's
    # SecretService backend blocks indefinitely on every lookup (e.g. during
    # ACP initialize and CLI onboarding), which times out the e2e and ACP
    # tests. Force a non-blocking in-memory backend.
    export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring

    # tests/tools/test_bash.py asserts on the English strerror text of a
    # failing `cat`. Since v2.23.0 the bash tool no longer pins LC_ALL for
    # spawned shells, so a translated builder locale breaks that test.
    export LC_MESSAGES=C

    # The e2e tests poll the rendered TUI with tight wall-clock deadlines
    # (5-15s) that assume an idle machine. On a loaded builder (parallel
    # builds, kernel compile in the background) the mock-server responses can
    # take far longer than that to render. The e2e patch exposes
    # VIBE_TEST_TIME_SCALE; stretch all e2e deadlines by 3x.
    export VIBE_TEST_TIME_SCALE=3

    # These two tests exercise scripts/install.sh and assume no `uv`/`vibe`
    # binary in /usr/bin or /bin. They fail on a builder that already has
    # system-wide installs (which this package itself provides). Skip them.
    local deselect=(
        --deselect tests/test_install_script.py::test_install_reports_missing_path_for_uv_tool_bin
        --deselect tests/test_install_script.py::test_install_fails_when_vibe_not_in_uv_tool_dir
	--deselect tests/cli/textual_ui/test_app_server_requests.py::test_ready_subagent_transcript_explains_next_actions_once
    )

    # Run test suite in parallel, skip deselected and any e2e tests.
    uv run pytest -n4 --timeout=60 "${deselect[@]}" --ignore=tests/e2e

    # Run e2e tests serially (these fail too often in parallel).
    uv run pytest -n0 --timeout=60 "${deselect[@]}" tests/e2e
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    echo "#!/usr/bin/env python3" > "${pkgdir}/usr/bin/vibe"
    pyver=$(python3 --version | awk '{print $2}' | cut -d. -f1,2)
    cat "${pkgdir}/usr/lib/python${pyver}/site-packages/vibe/cli/entrypoint.py" >> "${pkgdir}/usr/bin/vibe"
    chmod 755 "${pkgdir}/usr/bin/vibe"
}
