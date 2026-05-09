# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=14.8.1
pkgrel=1
pkgdesc="AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('gcc-libs' 'glibc' 'icu' 'zlib')
makedepends=('bun' 'rustup')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/can1357/oh-my-pi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9db7596b8834868009c30f26e4594c5b1b0e88b3e114b3c5214441c0f03c3d40')

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

    CI=1 TARGET_PLATFORM='linux' TARGET_ARCH='x64' TARGET_VARIANTS='baseline modern' \
        bun run ci:build:native

    RELEASE_TARGETS='linux-x64' bun run ci:release:build-binaries
}

package() {
    cd "${srcdir}/oh-my-pi-${pkgver}"

    install -Dm755 "packages/coding-agent/binaries/omp-linux-x64" "${pkgdir}/usr/bin/omp"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
