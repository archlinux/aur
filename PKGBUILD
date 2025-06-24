# Maintainer: wackbyte <im@purring.fyi>

_pkgname=Wasynth
pkgname=wasynth
pkgver=0.13.0
pkgrel=2
pkgdesc='WebAssembly translation tools targeting Lua'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/Rerumu/${_pkgname}"
license=('GPL-3.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('dffe0c9c89f1ad7667c2fc84392d51b75925f05dd00b3038f5ca21a8733943f9e36c43e8bd7050d189949134f813c8b89b451638413907e5186e402ba3d5c798')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${_pkgname}-${pkgver}"
    # Wasynth does not publish a Cargo.lock file.
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${_pkgname}-${pkgver}"
    # Binaries must be specified to prevent the fuzz targets (which depend on libFuzzer) from being
    # built.
    cargo build --frozen --release --bin wasm2luajit --bin wasm2luau
}

# Tests require the WebAssembly test suite repository (https://github.com/WebAssembly/testsuite) as
# a Git submodule, so no check.

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" target/release/wasm2luajit
    install -Dm0755 -t "${pkgdir}/usr/bin/" target/release/wasm2luau
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
