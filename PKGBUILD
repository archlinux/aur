# Maintainer: Your Name <your.email@example.com>

pkgname=tgt-client-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple TUI for Telegram"
arch=('x86_64')
url="https://github.com/FedericoBruzzone/tgt"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'tdlib')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/FedericoBruzzone/tgt.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/tgt"
    cargo fetch --locked
}

build() {
    cd "$srcdir/tgt"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked --no-default-features --features download-tdlib
}

package() {
    cd "$srcdir/tgt"
    
    # Install binary
    install -Dm755 "target/release/tgt" "$pkgdir/usr/bin/tgt"
    
    # Install license files
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    
    # Install example configurations if they exist
    if [ -d "examples" ]; then
        install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
        cp -r examples/* "$pkgdir/usr/share/doc/$pkgname/examples/"
    fi
}

# vim: ts=2 sw=2 et:
