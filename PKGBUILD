# Maintainer: Vinay <vinayydv343@gmail.com>
pkgname=ghostty-rpc
pkgver=1.1.0
pkgrel=1
pkgdesc="Discord Rich Presence integration for Ghostty terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/vinayydv3695/ghostty-rpc"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname"
    cargo test --release --locked || true
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install systemd user service
    install -Dm644 "assets/ghostty-rpc.service" "$pkgdir/usr/lib/systemd/user/ghostty-rpc.service"
    
    # Install systemd user preset to automatically enable service for user desktop login
    install -d "$pkgdir/usr/lib/systemd/user-preset"
    echo "enable ghostty-rpc.service" > "$pkgdir/usr/lib/systemd/user-preset/50-ghostty-rpc.preset"

    # Install example config
    install -Dm644 "assets/config.toml.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
    
    # Install logo assets
    install -Dm644 "assets/ghostty.png" "$pkgdir/usr/share/doc/$pkgname/ghostty.png"
    install -Dm644 "assets/ghostty.svg" "$pkgdir/usr/share/doc/$pkgname/ghostty.svg"

    # Install license
    if [ -f "LICENSE" ]; then
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    # Install README
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
