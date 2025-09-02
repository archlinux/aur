# Maintainer: X-LeeHe <a2956962139@outlook.com>

pkgname=tgt-client-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple TUI for Telegram"
arch=('x86_64')
url="https://github.com/FedericoBruzzone/tgt"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'tdlib-td' 'libc++' 'libc++abi' 'libunwind')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/FedericoBruzzone/tgt.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/tgt"
    cargo fetch --locked
    
    # Create compatibility symlink in build directory
    if [ ! -f /usr/lib/libunwind.so.1 ] && [ -f /usr/lib/libunwind.so.8 ]; then
        ln -sf /usr/lib/libunwind.so.8 "$srcdir/tgt/libunwind.so.1"
    fi
}

build() {
    cd "$srcdir/tgt"
    export RUSTUP_TOOLCHAIN=stable
    export ZSTD_SYS_USE_PKG_CONFIG=0
    export PKG_CONFIG_PATH=/usr/lib/pkgconfig:$PKG_CONFIG_PATH
    export LD_LIBRARY_PATH="$srcdir/tgt:$LD_LIBRARY_PATH"
    cargo build --release --features download-tdlib
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
