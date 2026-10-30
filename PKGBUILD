# Maintainer: mileswithtails_ <gabmaykin@bk.ru>
pkgname=gigactl-git
pkgver=1.0.r71.g79ad2d5
pkgrel=1
pkgdesc="Fan and RGB keyboard backlight control for Gigabyte G5/G6 gaming laptops"
arch=('any')
url="https://github.com"
license=('GPL-3.0-or-later')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'polkit' 'dbus' 'nbfc-linux')
makedepends=('git')
provides=('gigactl')
conflicts=('gigactl')
source=("$pkgname::git+https://github.com/smairio/gigactl")
install=gigactl.install
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gigactl-git"
    printf "1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/gigactl-git"

    install -Dm755 gfan "$pkgdir/usr/bin/gfan"
    install -Dm755 gkbd "$pkgdir/usr/bin/gkbd"
    install -Dm644 gigactl-cli-lib.sh "$pkgdir/usr/lib/gigactl/gigactl-cli-lib.sh"

    install -Dm644 man/gfan.1 "$pkgdir/usr/share/man/man1/gfan.1"
    install -Dm644 man/gkbd.1 "$pkgdir/usr/share/man/man1/gkbd.1"
    install -Dm644 man/gigactl-gui.1 "$pkgdir/usr/share/man/man1/gigactl-gui.1"
    install -Dm644 man/gigactld.8 "$pkgdir/usr/share/man/man8/gigactld.8"

    install -d "$pkgdir/opt/gigactl/gigactld" "$pkgdir/opt/gigactl/gigactl_gui"
    install -m644 daemon/gigactld/*.py "$pkgdir/opt/gigactl/gigactld/"
    install -m644 gui/gigactl_gui/*.py "$pkgdir/opt/gigactl/gigactl_gui/"


    cat > "$pkgdir/opt/gigactl/launcher" <<'EOF'
#!/usr/bin/python3
import os
import sys
from importlib import import_module

PRIVATE_DIR = "/opt/gigactl"
PROGRAMS = {"gigactld": "gigactld", "gigactl-gui": "gigactl_gui"}

def main() -> int:
    invoked = os.path.basename(sys.argv[0])
    package = PROGRAMS.get(invoked)
    if package is None:
        print(f"{invoked}: not a gigactl entry point — expected one of "
              f"{', '.join(sorted(PROGRAMS))}", file=sys.stderr)
        return 2
    sys.path.insert(0, PRIVATE_DIR)
    return import_module(f"{package}.__main__").main()

if __name__ == "__main__":
    raise SystemExit(main())
EOF
    chmod 755 "$pkgdir/opt/gigactl/launcher"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/gigactl/launcher "$pkgdir/usr/bin/gigactld"
    ln -s /opt/gigactl/launcher "$pkgdir/usr/bin/gigactl-gui"

    install -Dm644 daemon/data/gigactl.service "$pkgdir/usr/lib/systemd/system/gigactl.service"
    install -Dm644 daemon/data/io.github.smairio.gigactl.conf "$pkgdir/etc/dbus-1/system.d/io.github.smairio.gigactl.conf"
    install -Dm644 daemon/data/io.github.smairio.gigactl.policy "$pkgdir/usr/share/polkit-1/actions/io.github.smairio.gigactl.policy"

    install -Dm644 debian/extra/modules-load.d/gigactl.conf "$pkgdir/etc/modules-load.d/gigactl.conf"
    install -Dm644 debian/extra/modprobe.d/gigactl.conf "$pkgdir/etc/modprobe.d/gigactl.conf"

    install -Dm644 systemd/gkbd-restore.service "$pkgdir/usr/lib/systemd/system/gkbd-restore.service"
    install -Dm755 systemd/system-sleep-gkbd "$pkgdir/usr/lib/systemd/system-sleep/gkbd"

    install -Dm644 gui/data/io.github.smairio.gigactl.desktop "$pkgdir/usr/share/applications/io.github.smairio.gigactl.desktop"
    install -Dm644 gui/data/gigactl-tray.desktop "$pkgdir/etc/xdg/autostart/gigactl-tray.desktop"

    install -Dm644 design/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.smairio.gigactl.svg"
    install -Dm644 design/icon-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.smairio.gigactl-symbolic.svg"
}
