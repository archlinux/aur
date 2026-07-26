# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=17.1.4
pkgrel=1
pkgdesc="AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('gcc-libs' 'glibc' 'icu' 'zlib')
makedepends=('bun' 'clang' 'cmake' 'git' 'rustup')
options=('!strip')
source=(
    "${pkgname}::git+https://github.com/can1357/oh-my-pi.git#tag=v${pkgver}"
    "tree-sitter-haskell-new-repo.patch"
    "skip-native-embed-for-aur.patch"
)
sha256sums=('SKIP'
            '5b004b65890244524e47e8d9d4cb4e363e32b9fdab5a42f6f065473bf7bf6068'
            'a81209715174b5413d5743ec4b461ffd71b1a1fc37bd4a7dcde23c27e35bc62f')

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -p1 -i "${srcdir}/skip-native-embed-for-aur.patch"
    # Use a maintained fork of tree-sitter-haskell to resolve a crash issue. See:
    # https://github.com/tree-sitter/tree-sitter-haskell/issues/144
    patch -p1 -i "${srcdir}/tree-sitter-haskell-new-repo.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_HOME="${srcdir}/rustup-home"

    local _toolchain

    _toolchain="$(awk -F'\"' '/^channel = / { print $2; exit }' rust-toolchain.toml)"
    if [[ -z ${_toolchain}   ]]; then
        msg2 "Unable to determine rustup toolchain from rust-toolchain.toml"
        return 1
    fi

    if ! rustup run "${_toolchain}" rustc --version >/dev/null 2>&1; then
        msg2 "Installing rustup toolchain ${_toolchain}..."
        rustup toolchain install "${_toolchain}"
    fi

    export RUSTUP_TOOLCHAIN="${_toolchain}"
    unset CI CC CXX CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS

    bun install --frozen-lockfile

    CI=1 TARGET_PLATFORM='linux' TARGET_ARCH='x64' TARGET_VARIANTS='baseline modern' \
        bun run ci:build:native

    RELEASE_TARGETS='linux-x64' bun run ci:release:build-binaries
}

_install_completions() {
    local _omp_bin="$1"
    local _completion_dir="${srcdir}/completions"
    local _runtime_dir="${srcdir}/completion-runtime"

    rm -rf "${_completion_dir}" "${_runtime_dir}"
    mkdir -p "${_completion_dir}" "${_runtime_dir}/home" "${_runtime_dir}/xdg"

    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions bash >"${_completion_dir}/omp.bash"
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions zsh >"${_completion_dir}/_omp"
    env HOME="${_runtime_dir}/home" XDG_DATA_HOME="${_runtime_dir}/xdg" \
        "${_omp_bin}" completions fish >"${_completion_dir}/omp.fish"

    install -Dm644 "${_completion_dir}/omp.bash" "${pkgdir}/usr/share/bash-completion/completions/omp"
    install -Dm644 "${_completion_dir}/_omp" "${pkgdir}/usr/share/zsh/site-functions/_omp"
    install -Dm644 "${_completion_dir}/omp.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/omp.fish"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "packages/coding-agent/binaries/omp-linux-x64" \
        "${pkgdir}/usr/lib/${pkgname}/omp"
    install -Dm755 "packages/natives/native/pi_natives.linux-x64-baseline.node" \
        "${pkgdir}/usr/lib/${pkgname}/pi_natives.linux-x64-baseline.node"
    install -Dm755 "packages/natives/native/pi_natives.linux-x64-modern.node" \
        "${pkgdir}/usr/lib/${pkgname}/pi_natives.linux-x64-modern.node"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "../lib/${pkgname}/omp" "${pkgdir}/usr/bin/omp"
    _install_completions "${pkgdir}/usr/bin/omp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
