# Maintainer: wackbyte <im@purring.fyi>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=0.18.0
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libffi')
makedepends=('cargo' 'clang')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uiua-lang/uiua/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('22a5498904a5cb9f4d3296bc963459803b00595886269a7f0e0b9f2c23827d4b7665d3649cabe5afe9c932147b190a1c668c8f9dd03b639f8d165d11680f7cb3')
options=(!lto)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --features 'full no_self_update system'
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo test --frozen --features 'full no_self_update system'
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license
}
