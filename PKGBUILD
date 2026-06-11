# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=15.11.1
pkgrel=1
pkgdesc="AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('gcc-libs' 'glibc' 'icu' 'zlib')
makedepends=('bun>=1.3.14' 'rustup')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/can1357/oh-my-pi/archive/refs/tags/v${pkgver}.tar.gz"
    "tree-sitter-haskell-gcc-no-strict-aliasing.patch"
    "skip-native-embed-for-aur.patch"
)
sha256sums=('0d4d837ac6370d1194f54dc09a4d1871fe8609b22d074532735b41bc5ea8be82'
            '3eea6cd7fc2e5fa973b81cac109688231e40087f51c3ce4cf01e45e1b7893b17'
            'e5cc7751f95d279705d2060040017a0ca76d1e980f36c51e93016754746c2b99')

# Patch to fix tree-sitter-haskell crash.
# See:
# https://github.com/tree-sitter/tree-sitter-haskell/pull/157
# https://github.com/tree-sitter/tree-sitter-haskell/issues/144
_patch_tree_sitter_haskell_gcc_workaround() {
    local _repo_root="$1"
    local _patch_file="${srcdir}/tree-sitter-haskell-gcc-no-strict-aliasing.patch"
    local _tsh_dirs=()
    export CARGO_HOME="${srcdir}/cargo-home"

    cargo fetch --locked --manifest-path "${_repo_root}/Cargo.toml"

    shopt -s nullglob
    _tsh_dirs=("${CARGO_HOME}"/registry/src/*/tree-sitter-haskell-*)
    shopt -u nullglob
    if (( ${#_tsh_dirs[@]} != 1 )); then
        msg2 "Expected exactly one fetched tree-sitter-haskell source directory, found ${#_tsh_dirs[@]}"
        return 1
    fi

    if patch -p1 -R -d "${_tsh_dirs[0]}" -i "${_patch_file}" --dry-run -sf; then
        msg2 "Ignoring patch: ${_patch_file}"
    else
        patch -p1 -d "${_tsh_dirs[0]}" -i "${_patch_file}"
    fi
}

prepare() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    patch -p1 -i "${srcdir}/skip-native-embed-for-aur.patch"
}

build() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    local _toolchain

    _toolchain="$(awk -F'\"' '/^channel = / { print $2; exit }' rust-toolchain.toml)"
    if [[ -z "${_toolchain}" ]]; then
        msg2 "Unable to determine rustup toolchain from rust-toolchain.toml"
        return 1
    fi

    if ! rustup run "${_toolchain}" rustc --version >/dev/null 2>&1; then
        msg2 "Installing rustup toolchain ${_toolchain}..."
        rustup toolchain install "${_toolchain}"
    fi

    export PATH="${HOME}/.cargo/bin:${PATH}"
    export RUSTUP_TOOLCHAIN="${_toolchain}"
    unset CI CC CXX CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS

    bun install --frozen-lockfile
    _patch_tree_sitter_haskell_gcc_workaround "${PWD}"

    CI=1 TARGET_PLATFORM='linux' TARGET_ARCH='x64' TARGET_VARIANTS='baseline modern' \
        bun run ci:build:native

    OMP_SKIP_NATIVE_EMBED=1 RELEASE_TARGETS='linux-x64' bun run ci:release:build-binaries
}

_install_completions() {
    local _omp_bin="$1"
    local _completion_dir="${srcdir}/completions"
    local _runtime_dir="${srcdir}/completion-runtime"

    rm -rf "${_completion_dir}" "${_runtime_dir}"
    mkdir -p "${_completion_dir}" "${_runtime_dir}/home" "${_runtime_dir}/xdg"

    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions bash > "${_completion_dir}/omp.bash"
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions zsh > "${_completion_dir}/_omp"
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions fish > "${_completion_dir}/omp.fish"

    install -Dm644 "${_completion_dir}/omp.bash" "${pkgdir}/usr/share/bash-completion/completions/omp"
    install -Dm644 "${_completion_dir}/_omp" "${pkgdir}/usr/share/zsh/site-functions/_omp"
    install -Dm644 "${_completion_dir}/omp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish"
}

package() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    install -Dm755 "packages/coding-agent/binaries/omp-linux-x64" "${pkgdir}/usr/bin/omp"
    install -Dm755 "packages/natives/native/pi_natives.linux-x64-baseline.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-baseline.node"
    install -Dm755 "packages/natives/native/pi_natives.linux-x64-modern.node" "${pkgdir}/usr/bin/pi_natives.linux-x64-modern.node"
    _install_completions "${pkgdir}/usr/bin/omp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
