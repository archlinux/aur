# Maintainer: mryll <https://github.com/mryll>
pkgname=waybar-logitech-battery
pkgver=0.1.0
pkgrel=1
pkgdesc='Waybar widgets and daemons for monitoring Logitech wireless peripheral battery levels'
arch=('any')
url='https://github.com/mryll/waybar-logitech-battery'
license=('MIT')
depends=('bash' 'waybar' 'python' 'python-hidapi')
install=waybar-logitech-battery.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/waybar-logitech-battery/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1bb44798961bca6670add896b5b52a1276e1733f7cd4f73da282520b5cc396c')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    make install-tools DESTDIR="$pkgdir" PREFIX=/usr

    # Systemd user services with correct ExecStart path
    install -Dm644 systemd/logitech-hidpp-monitor.service \
        "$pkgdir/usr/lib/systemd/user/logitech-hidpp-monitor.service"
    install -Dm644 systemd/logitech-headset-monitor.service \
        "$pkgdir/usr/lib/systemd/user/logitech-headset-monitor.service"

    # Fix ExecStart to use /usr/bin
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/logitech-hidpp-monitor|' \
        "$pkgdir/usr/lib/systemd/user/logitech-hidpp-monitor.service"
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/logitech-headset-monitor|' \
        "$pkgdir/usr/lib/systemd/user/logitech-headset-monitor.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
