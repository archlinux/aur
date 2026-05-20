# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi
pkgver=15.1.8
pkgrel=1
pkgdesc="AI coding agent for the terminal — hash-anchored edits, optimized tool harness, LSP, Python, browser, subagents, and more"
arch=('x86_64')
url="https://github.com/can1357/oh-my-pi"
license=('MIT')
depends=('gcc-libs' 'glibc' 'icu' 'zlib')
makedepends=('bun>=1.3.14' 'rustup')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/can1357/oh-my-pi/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9463936beb98c1df19c5f0181db469bd170eaba4c155d6d616843daf4dd949f0')

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
