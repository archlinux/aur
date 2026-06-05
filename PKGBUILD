# Maintainer: Smokey-thc <mauricelutz765@gmail.com>
pkgname=fanflow
pkgver=0.1.0
pkgrel=1
pkgdesc="Fan controller for Linux with a native HTML GUI (hwmon + NVIDIA NVML)"
arch=('x86_64')
url="https://github.com/Smokey-thc/Fanflow"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
optdepends=('nvidia-utils: NVIDIA GPU fan control via NVML')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ec53a5d102d334eec35a13c3d1ed30980a773ed1d6e363ac509ee850e4eab20')

build() {
    cd "Fanflow-$pkgver"
    cargo build --release
}

package() {
    cd "Fanflow-$pkgver"

    install -Dm755 "target/release/fanflow" \
        "$pkgdir/usr/bin/fanflow"

    install -Dm644 "packaging/fanflow-daemon.service" \
        "$pkgdir/usr/lib/systemd/user/fanflow-daemon.service"

    install -Dm644 "packaging/fanflow.desktop" \
        "$pkgdir/usr/share/applications/fanflow.desktop"

    install -Dm644 "packaging/fancontroller.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/fanflow.svg"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo ""
    echo "==> Fanflow installed."
    echo "==> Enable autostart (optional):"
    echo "      systemctl --user enable --now fanflow-daemon"
    echo "==> On first launch, run once to set up permissions:"
    echo "      fanflow"
    echo ""
}
