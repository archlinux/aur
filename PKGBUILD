# Maintainer: LifeOfATitan <abdoul@designsunreal.com>
pkgname=orbit-wifi
pkgver=0.1.2
pkgrel=1
pkgdesc="A WiFi/Bluetooth manager for Wayland with glassmorphism UI"
arch=('x86_64')
url="https://github.com/LifeOfATitan/orbit"
license=('MIT')
install=orbit.install
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'networkmanager'
    'bluez'
)
makedepends=(
    'cargo'
    'rust'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "orbit.service")
sha256sums=('461a5286f98da7bd51633dac176607970c6f29b4dab65dfee9f875b98fa90cfe'
            '5f4188533d3d98162972f54406f40d19ba8a72d2d710b22e4e9e5af7f59f1d58')

prepare() {
    cd "orbit-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "orbit-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "orbit-$pkgver"
    install -Dm755 "target/release/orbit" "$pkgdir/usr/bin/orbit"
    
    # Install systemd service
    install -Dm644 "$srcdir/orbit.service" "$pkgdir/usr/lib/systemd/user/orbit.service"
    
    # Install README and LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
