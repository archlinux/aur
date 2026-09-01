# Maintainer: mryll <https://github.com/mryll>
pkgname=logibar
pkgver=0.5.2
pkgrel=1
pkgdesc='Waybar widgets and daemons for monitoring Logitech wireless peripheral battery levels'
arch=('any')
url='https://github.com/mryll/logibar'
license=('MIT')
depends=('bash' 'waybar' 'python' 'python-hidapi')
optdepends=('ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (--tooltip-font)')
conflicts=('waybar-logitech-battery')
provides=('waybar-logitech-battery')
install=logibar.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/logibar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e82d4693505e599d608244556ff1f532a5dcaf69700a7da7e3c3568583d5b24')

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

    # Udev rule for HID device access
    install -Dm644 udev/70-logitech-hidraw.rules \
        "$pkgdir/usr/lib/udev/rules.d/70-logitech-hidraw.rules"

    # Enable services by default (symlinks into default.target.wants)
    install -dm755 "$pkgdir/usr/lib/systemd/user/default.target.wants"
    ln -s ../logibar-hidpp-monitor.service \
        "$pkgdir/usr/lib/systemd/user/default.target.wants/logibar-hidpp-monitor.service"
    ln -s ../logibar-headset-monitor.service \
        "$pkgdir/usr/lib/systemd/user/default.target.wants/logibar-headset-monitor.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
