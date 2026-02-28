# Maintainer: m5rcel <your-email@example.com>
pkgname=m5rcode
pkgver=0.3.2
pkgrel=1
pkgdesc="Modern programming language combining Python, C, Java, Rust, and Ruby features"
arch=('x86_64')
url="https://github.com/m5rcode/m5rcode"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/m5rcode/m5rcode/archive/v$pkgver.tar.gz")
sha256sums=('f34e155468c3f3ce19ee3ea9b4e6bec206836902d2b64c84e3ea221f0a0f9766')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binaries
    install -Dm755 target/release/m5repl "$pkgdir/usr/bin/m5repl"
    install -Dm755 target/release/m5rcode "$pkgdir/usr/bin/m5rcode" 2>/dev/null || true
    
    # Install tools
    for tool in m5fmt m5lint m5idle; do
        if [ -f "target/release/$tool" ]; then
            install -Dm755 "target/release/$tool" "$pkgdir/usr/bin/$tool"
        fi
    done
    
    # Install Discord bridge
    if [ -f "runtime/discord/target/release/m5rcode-discord" ]; then
        install -Dm755 runtime/discord/target/release/m5rcode-discord "$pkgdir/usr/bin/m5rcode-discord"
    fi
    
    # Install standard library
    install -dm755 "$pkgdir/usr/share/m5rcode/stdlib"
    cp -r stdlib/* "$pkgdir/usr/share/m5rcode/stdlib/"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG_v0.3.2.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    
    # Install examples
    install -dm755 "$pkgdir/usr/share/m5rcode/examples"
    cp -r examples/* "$pkgdir/usr/share/m5rcode/examples/"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
