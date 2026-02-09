pkgname=lazyrss
pkgver=0.1.0
pkgrel=5
pkgdesc="A terminal-based RSS/Atom feed reader TUI inspired by lazygit"
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/lazyrss"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('d6272482c13d1d49a3a26283fb34ba5fd61d0f2cbe07600839492ae7fbb2ec28')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "${pkgname}-${pkgver}/man/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1/"
}
