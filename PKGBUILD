pkgname=acer-sense-git
pkgver=r4.ed4c02f
pkgrel=1
pkgdesc="Linux alternative for AcerSense (Fan control, Battery limit, Profiles, Hyprland)"
arch=('any')
url="https://github.com/MaksSuRitik/acer-sense"
license=('GPL-3.0-or-later')
depends=(
    'python-pyqt6'
    'python-psutil'
    'polkit'
    'power-profiles-daemon'
    'alsa-tools'
    'smartmontools'
    'dbus'
)
makedepends=('git')
provides=('acer-sense')
conflicts=('acer-sense')
optdepends=(
    'hyprsunset: BluelightShield на Hyprland'
    'wlsunset: BluelightShield на других Wayland-compositor'
    'hyprland: интеграция горячих клавиш (XF86Launch6 → mic)'
    'wireplumber: wpctl для переключения микрофона'
)
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

    # Исходный код
    cp -r src scripts assets "$pkgdir/usr/lib/acer-sense/"
    chmod +x "$pkgdir/usr/lib/acer-sense/scripts/"*.sh
    chmod +x "$pkgdir/usr/lib/acer-sense/src/main.py"

    # Бинарник в PATH
    ln -s /usr/lib/acer-sense/src/main.py "$pkgdir/usr/bin/acer-sense"

    # Установщик Hyprland-биндингов и утилита переключения профиля
    ln -s /usr/lib/acer-sense/scripts/hyprland-setup.sh "$pkgdir/usr/bin/acer-sense-hyprland-setup"
    ln -s /usr/lib/acer-sense/scripts/power-cycle.sh "$pkgdir/usr/bin/acer-sense-power-cycle"

    # Конфиги
    install -Dm644 data/acer-sense.desktop "$pkgdir/usr/share/applications/"
    install -Dm644 data/org.acer.sense.policy "$pkgdir/usr/share/polkit-1/actions/"
    install -Dm644 data/hda-verb.policy "$pkgdir/usr/share/polkit-1/actions/"
    install -Dm644 data/acer-fans.service "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 data/mic-sync.service "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 data/ec_sys.conf "$pkgdir/etc/modprobe.d/"
}
