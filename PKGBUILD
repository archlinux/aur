# Maintainer: Ayush Jaipuriyar <ayushjaipuriyar@gmail.com>
pkgname=kbd-backlight
pkgver=1.0.0
pkgrel=1
pkgdesc="Intelligent keyboard backlight daemon with automatic brightness control"
arch=('x86_64' 'aarch64')
url="https://github.com/ayushjaipuriyar/kbd-backlight"
license=('MIT')
depends=('dbus' 'wayland' 'libx11' 'libxss')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
    install -Dm755 "target/release/kbd-backlight" "$pkgdir/usr/bin/kbd-backlight"
    install -Dm755 "target/release/kbd-backlight-daemon" "$pkgdir/usr/bin/kbd-backlight-daemon"
    
    # Install systemd service
    install -Dm644 "kbd-backlight-daemon.service" "$pkgdir/usr/lib/systemd/user/kbd-backlight-daemon.service"
    
    # Install example configurations
    install -Dm644 "config-example.toml" "$pkgdir/usr/share/doc/$pkgname/examples/config.toml"
    install -Dm644 "profiles-example/home.toml" "$pkgdir/usr/share/doc/$pkgname/examples/profiles/home.toml"
    install -Dm644 "profiles-example/office.toml" "$pkgdir/usr/share/doc/$pkgname/examples/profiles/office.toml"
    install -Dm644 "profiles-example/mobile.toml" "$pkgdir/usr/share/doc/$pkgname/examples/profiles/mobile.toml"
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
