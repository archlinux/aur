# Maintainer: wackbyte <im@purring.fyi>

_pkgname=wasynth
pkgname=wasynth-git
pkgver=0.13.0.r8.g27f3498
pkgrel=3
pkgdesc='WebAssembly translation tools targeting Lua'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/Rerumu/Wasynth"
license=('GPL-3.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("wasynth=${pkgver}")
conflicts=('wasynth')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    # Wasynth does not publish a Cargo.lock file.
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    # Binaries must be specified to prevent the fuzz targets (which depend on libFuzzer) from being
    # built.
    cargo build --frozen --release --bin wasm2luajit --bin wasm2luau
}

# Tests require the WebAssembly test suite repository (https://github.com/WebAssembly/testsuite) as
# a Git submodule, so no check.

package() {
    cd $_pkgname
    install -Dm0755 -t "${pkgdir}/usr/bin/" target/release/wasm2luajit
    install -Dm0755 -t "${pkgdir}/usr/bin/" target/release/wasm2luau
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
