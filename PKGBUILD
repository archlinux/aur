pkgname=acer-sense-git
pkgver=r2.486fa05
pkgrel=1
pkgdesc="Linux alternative for AcerSense (Fan control, Battery limit, Profiles)"
arch=('any')
url="https://github.com/MaksSuRitik/acer-sense"
license=('GPL-3.0-or-later')
depends=('python-pyqt6' 'python-psutil' 'polkit' 'power-profiles-daemon' 'alsa-tools' 'smartmontools')
makedepends=('git')
provides=('acer-sense')
conflicts=('acer-sense')
optdepends=('hyprsunset: for BluelightShield feature on Hyprland'
            'wlsunset: for BluelightShield feature on other Wayland compositors')
source=("git+https://github.com/MaksSuRitik/acer-sense.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"

    find src -type d -name "__pycache__" -exec rm -rf {} +

    install -dm755 "$pkgdir/usr/lib/acer-sense"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/polkit-1/actions"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    install -dm755 "$pkgdir/etc/modprobe.d"

    # Код
    cp -r src scripts assets "$pkgdir/usr/lib/acer-sense/"
    chmod +x "$pkgdir/usr/lib/acer-sense/scripts/"*.sh
    chmod +x "$pkgdir/usr/lib/acer-sense/src/main.py"

    # Бінарник
    ln -s /usr/lib/acer-sense/src/main.py "$pkgdir/usr/bin/acer-sense"

    # Конфіги
    install -Dm644 data/acer-sense.desktop "$pkgdir/usr/share/applications/"
    install -Dm644 data/org.acer.sense.policy "$pkgdir/usr/share/polkit-1/actions/"
    install -Dm644 data/hda-verb.policy "$pkgdir/usr/share/polkit-1/actions/"
    install -Dm644 data/acer-fans.service "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 data/mic-sync.service "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 data/ec_sys.conf "$pkgdir/etc/modprobe.d/"
}
