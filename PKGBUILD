pkgname=acer-sense-git
pkgver=2.6
pkgrel=1
pkgdesc="Linux alternative for AcerSense (Fan control, Battery limit, Profiles, Hyprland)"
arch=('any')
url="https://github.com/MaksSuRitik/acer-sense"
license=('GPL-3.0-or-later')
install=acer-sense.install
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
    'wlsunset: BluelightShield на других Wayland-композиторах'
    'hyprland: интеграция горячих клавиш (XF86Launch6 → микрофон, Fn+F → профили)'
    'wireplumber: wpctl для управления громкостью и микрофоном'
    'nvidia-utils: nvidia-smi для считывания температуры дискретного GPU'
)
source=("git+https://github.com/MaksSuRitik/acer-sense.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/${pkgname%-git}"

    find src -type d -name "__pycache__" -exec rm -rf {} +

    install -dm755 "$pkgdir/usr/lib/acer-sense"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/pixmaps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -dm755 "$pkgdir/usr/share/polkit-1/actions"
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    install -dm755 "$pkgdir/usr/lib/systemd/user"
    install -dm755 "$pkgdir/etc/modprobe.d"

    # Исходный код и ресурсы
    cp -r src scripts assets "$pkgdir/usr/lib/acer-sense/"
    chmod +x "$pkgdir/usr/lib/acer-sense/scripts/"*.sh
    chmod +x "$pkgdir/usr/lib/acer-sense/src/main.py"

    # Бинарники и утилиты в PATH
    ln -s /usr/lib/acer-sense/src/main.py "$pkgdir/usr/bin/acer-sense"
    ln -s /usr/lib/acer-sense/scripts/hyprland-setup.sh "$pkgdir/usr/bin/acer-sense-hyprland-setup"
    ln -s /usr/lib/acer-sense/scripts/power-cycle.sh "$pkgdir/usr/bin/acer-sense-power-cycle"
    ln -s /usr/lib/acer-sense/scripts/acer-battery-monitor.sh "$pkgdir/usr/bin/acer-sense-battery-monitor"

    # Иконки
    install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/acer-sense.png"
    install -Dm644 assets/acer-sense.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/acer-sense.svg"

    # Конфиги и политики
    install -Dm644 data/acer-sense.desktop "$pkgdir/usr/share/applications/"
    install -Dm644 data/org.acer.sense.policy "$pkgdir/usr/share/polkit-1/actions/"
    install -Dm644 data/hda-verb.policy "$pkgdir/usr/share/polkit-1/actions/"
    install -Dm644 data/acer-fans.service "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 data/acer-battery.service "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 data/mic-sync.service "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 data/ec_sys.conf "$pkgdir/etc/modprobe.d/"
}
