# Maintainer: moreiramelo
pkgname=apple-battery-guard
pkgver=0.1.3
pkgrel=1
pkgdesc="Intelligent battery charge threshold manager for MacBooks on Linux"
arch=('x86_64')
url="https://github.com/michaelmoreira/apple-battery-guard"
license=('MIT')
depends=('glibc')
makedepends=('rust' 'cargo')
optdepends=(
    'applesmc-next-dkms: required if kernel lacks charge_control_end_threshold support'
    'auto-cpufreq: CPU frequency management (recommended for battery life)'
    'mbpfan: fan speed control for MacBooks'
    'tlp: system-wide power saving (USB, WiFi, disk, PCIe)'
)
backup=('etc/apple-battery-guard/apple-battery-guard.toml')
install=apple-battery-guard.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('96b7e740b6b60a9c0696e52cbf1b326337416f37fd4bbbe67eaa13f9c7ba54db')

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

    # Binário principal
    install -Dm755 target/release/abg "$pkgdir/usr/bin/abg"

    # Script de setup de gestão de energia (instalado como comando)
    install -Dm755 scripts/setup-power.sh \
        "$pkgdir/usr/bin/apple-battery-guard-setup-power"

    # Configurações
    install -Dm644 config/apple-battery-guard.toml \
        "$pkgdir/etc/apple-battery-guard/apple-battery-guard.toml"
    install -Dm644 config/auto-cpufreq.conf \
        "$pkgdir/usr/share/apple-battery-guard/auto-cpufreq.conf"
    install -Dm644 config/mbpfan.conf \
        "$pkgdir/usr/share/apple-battery-guard/mbpfan.conf"
    install -Dm644 config/tlp-macbook.conf \
        "$pkgdir/usr/share/apple-battery-guard/tlp-macbook.conf"

    # Serviço systemd
    install -Dm644 systemd/apple-battery-guard.service \
        "$pkgdir/usr/lib/systemd/system/apple-battery-guard.service"

    # Licença
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
