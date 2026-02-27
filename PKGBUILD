# Maintainer: mryll <https://github.com/mryll>
pkgname=logibar
pkgver=0.1.0
pkgrel=1
pkgdesc='Waybar widgets and daemons for monitoring Logitech wireless peripheral battery levels'
arch=('any')
url='https://github.com/mryll/logibar'
license=('MIT')
depends=('bash' 'waybar' 'python' 'python-hidapi')
install=logibar.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/logibar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b6809bc89cbd5d83a69718bb6b91a7056e5290fc712c7d53417b60acdd49e53')

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    make install-tools DESTDIR="$pkgdir" PREFIX=/usr

    # Systemd user services with correct ExecStart path
    install -Dm644 systemd/logibar-hidpp-monitor.service \
        "$pkgdir/usr/lib/systemd/user/logibar-hidpp-monitor.service"
    install -Dm644 systemd/logibar-headset-monitor.service \
        "$pkgdir/usr/lib/systemd/user/logibar-headset-monitor.service"

    # Fix ExecStart to use /usr/bin
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/logibar-hidpp-monitor|' \
        "$pkgdir/usr/lib/systemd/user/logibar-hidpp-monitor.service"
    sed -i 's|ExecStart=.*|ExecStart=/usr/bin/logibar-headset-monitor|' \
        "$pkgdir/usr/lib/systemd/user/logibar-headset-monitor.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
