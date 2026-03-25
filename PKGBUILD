# Maintainer: moreiramelo
pkgname=apple-battery-guard
pkgver=0.1.0
pkgrel=1
pkgdesc="Intelligent battery charge threshold manager for MacBooks on Linux"
arch=('x86_64')
url="https://github.com/michaelmoreira/apple-battery-guard"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
optdepends=('applesmc-next-dkms: required if kernel lacks charge_control_end_threshold support')
backup=('etc/apple-battery-guard/apple-battery-guard.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('801722d280f07b0a0b8d05a0005bd4a97691f7cf66c7dc3aeda6b37903f0e71f')

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

    # Binário
    install -Dm755 target/release/abg "$pkgdir/usr/bin/abg"

    # Configuração
    install -Dm644 config/apple-battery-guard.toml \
        "$pkgdir/etc/apple-battery-guard/apple-battery-guard.toml"

    # Serviço systemd
    install -Dm644 systemd/apple-battery-guard.service \
        "$pkgdir/usr/lib/systemd/system/apple-battery-guard.service"

    # Licença
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
