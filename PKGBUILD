pkgname=lazyrss
pkgver=1.0.0
pkgrel=0
pkgdesc="A terminal-based RSS/Atom feed reader TUI inspired by lazygit"
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/lazyrss"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('8285cf31c72f43948e17dd23116582ee5a8a821e276d54b43f5ef4ef713d1c64')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}-${pkgver}"
    CFLAGS+=' -ffat-lto-objects'
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
    install -Dm644 "man/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1/"
}
