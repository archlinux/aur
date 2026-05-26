# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=15.4.1
pkgrel=2
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
)
sha256sums=('55c015daa69170d1a5ef8d58abad51aac3324bc0aa2cb4dae3a1d648d420a7a6'
            '3eea6cd7fc2e5fa973b81cac109688231e40087f51c3ce4cf01e45e1b7893b17')

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

    RELEASE_TARGETS='linux-x64' bun run ci:release:build-binaries
}

package() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    install -Dm755 "packages/coding-agent/binaries/omp-linux-x64" "${pkgdir}/usr/bin/omp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
