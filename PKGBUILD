# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=17.2.1
pkgrel=1
pkgdesc="AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('glibc' 'opus' 'pcre2')
makedepends=('bazel' 'bun' 'git')
options=('!strip')
source=(
    "${pkgname}::git+https://github.com/can1357/oh-my-pi.git#tag=v${pkgver}"
    "tree-sitter-no-strict-aliasing.patch"
    "use-system-opus-pcre2.patch"
    "skip-native-embed-for-aur.patch"
    "embed-header-generator-data.patch"
)
sha256sums=('SKIP'
            'a3af6b88fa05125f1ba0e9b25b0fad769446fdea9707a145385bd28429ffdd32'
            'b15916b7fa894f498c66562dad5045479143722b033f6a1fb90377abdc6b1ac5'
            'a81209715174b5413d5743ec4b461ffd71b1a1fc37bd4a7dcde23c27e35bc62f'
            '09317a262db1a314cbf2a7f4efcfbcead37d000e148c82512abd5f533d857b3e')

prepare() {
    cd "${srcdir}/${pkgname}"

    patch -p1 -i "${srcdir}/skip-native-embed-for-aur.patch"
    patch -p1 -i "${srcdir}/use-system-opus-pcre2.patch"
    patch -p1 -i "${srcdir}/tree-sitter-no-strict-aliasing.patch"
    patch -p1 -i "${srcdir}/embed-header-generator-data.patch"
    # Crate annotations change the Bazel crate graph; Cargo.Bazel.lock needs a repin.
    CARGO_BAZEL_REPIN=1 bazel fetch @crates//...
}

build() {
    cd "${srcdir}/${pkgname}"

    unset CI CC CXX CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS

    bun install --frozen-lockfile

    # rules_rust fetches the pinned nightly rustc and cargo; no host rust toolchain.
    bun ./scripts/bazel-natives.ts linux-x64-baseline linux-x64-modern --dest packages/natives/native

    RELEASE_TARGETS='linux-x64' bun run ci:release:build-binaries

    # Release the server holding an output base under $srcdir.
    bazel shutdown
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
