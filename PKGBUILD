# Maintainer: Robin Trioux <robin@trioux.eu>
# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=mistral-vibe
pkgver=3.1.0
pkgrel=1
pkgdesc='Minimal CLI coding agent by Mistral'
arch=('x86_64')
url='https://github.com/mistralai/mistral-vibe'
license=(Apache-2.0)
depends=(
    "python"
    "python-agent-client-protocol"
    "python-anyio"
    "python-authlib"
    "python-cachetools"
    "python-certifi"
    "python-charset-normalizer"
    "python-croniter"
    "python-dateutil"
    "python-dotenv"
    "python-gitpython"
    "python-giturlparse"
    "python-google-auth"
    "python-httpx2"
    "python-jsonpatch"
    "python-jsonpointer"
    "python-joserfc"
    "python-keyring"
    "python-mcp"
    "python-mcp-types"
    "python-miniaudio"
    "python-mistralai"
    "python-opentelemetry-api"
    "python-opentelemetry-exporter-otlp"
    "python-opentelemetry-sdk"
    "python-opentelemetry-semantic-conventions"
    "python-pydantic"
    "python-pydantic-settings"
    "python-rfc8785"
    "python-sentry_sdk"
    "python-setproctitle"
    "python-socksio"
    "python-tomli-w"
    "python-tree-sitter"
    "python-tree-sitter-bash"
    "python-truststore"
    "python-uuid-utils"
    "uvicorn"
    "python-watchfiles"
    "python-websockets"
    "python-yaml"
    "python-zstandard"
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
        "stretch_e2e_timeouts_when_builder_is_loaded.patch")
sha256sums=('SKIP'
            '38eaabbd231af198b4184d9d5d4cdb898ddb5365d6d5080a125054e294e6633c')

prepare() {
    cd "$pkgname"
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
    # Sanitize the makepkg toolchain flags for the C compilers the build
    # drives (the onig_sys / aws-lc-sys build scripts of vibe-rs). -flto
    # leaves native archives the final link cannot use (see the RUSTFLAGS
    # note above). Since v3.0 the vibe-rs build links through the zig cc
    # shim (clang), which rejects the GCC-ism -mtune=generic with "unknown
    # target CPU"; generic is the default tune for both gcc and clang, so
    # dropping it is a no-op otherwise. The zig cc shim also does not
    # recognize -march=x86-64, so strip that as well.
    CFLAGS="$(sed -E 's/-flto(=[^ ]+)?//g; s/-mtune=generic//g; s/-march=[^ ]+//g' <<<"$CFLAGS")"
    CXXFLAGS="$(sed -E 's/-flto(=[^ ]+)?//g; s/-mtune=generic//g; s/-march=[^ ]+//g' <<<"$CXXFLAGS")"
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

    # These tests exercise scripts/install.sh and assume no `uv`/`vibe`
    # binary in /usr/bin or /bin. They fail on a builder that already has
    # system-wide installs (which this package itself provides). Skip them.
    local deselect=(
        --deselect tests/test_install_script.py::test_install_reports_missing_path_for_uv_tool_bin
        --deselect tests/test_install_script.py::test_install_fails_when_vibe_not_in_uv_tool_dir
        --deselect tests/test_install_script.py::test_install_pins_the_gil_build_of_python_314
        --deselect tests/test_install_script.py::test_install_seeds_a_managed_gil_python_when_the_pinned_request_fails
    )

    # Run test suite in parallel, skip deselected and any e2e tests.
    # e2e tests are skipped in the AUR build as they require a specific environment
    # and are known to be flaky (timeout issues, TUI interaction, etc.)
    uv run pytest -n4 --timeout=60 "${deselect[@]}" --ignore=tests/e2e
}

package() {
    cd "$pkgname"
    # The wheel ships entry_points.txt (vibe, vibe-acp, vibe-app-server):
    # python-installer generates the /usr/bin scripts, including /usr/bin/vibe,
    # which imports vibe.cli.launcher:main and execs the bundled vibe-rs TUI.
    python -m installer --destdir="$pkgdir" dist/*.whl
}
