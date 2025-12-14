# Maintainer: Spoorloos <mick.negenman@icloud.com>

pkgname="geteduroam-gui-bin"
pkgver="0.12"
pkgrel=1
pkgdesc="geteduroam Linux client"
url="https://github.com/geteduroam/linux-app"
license=("BSD-3-Clause")
arch=("x86_64")
depends=("gtk4" "libadwaita" "libnotify" "networkmanager" "hicolor-icon-theme")
source=("geteduroam-gui_linux_amd64.deb::$url/releases/download/$pkgver/geteduroam-gui_linux_amd64.deb"
        "LICENSE::$url/raw/refs/tags/$pkgver/LICENSE")
sha256sums=("307e01f277ce241ca928b9549efe47dc050598ecc28d6cd0ab315f9c10cfce9c"
            "8d714baa7c1260c1eb4ad9c332feb3e27aade76faff0d4f672d4cbf4ffb95c45")

prepare() {
    tar -xzf "$srcdir/data.tar.gz"
}

package() {
    # Install systemd services
    install -Dm644 "$srcdir/etc/systemd/user/geteduroam-notifs.service" \
        "$pkgdir/etc/systemd/user/geteduroam-notifs.service"
    install -Dm644 "$srcdir/etc/systemd/user/geteduroam-notifs.timer" \
        "$pkgdir/etc/systemd/user/geteduroam-notifs.timer"

    # Install binaries
    install -Dm755 "$srcdir/usr/bin/geteduroam-gui" "$pkgdir/usr/bin/geteduroam-gui"
    install -Dm755 "$srcdir/usr/bin/geteduroam-notifcheck" "$pkgdir/usr/bin/geteduroam-notifcheck"

    # Install desktop file
    install -Dm644 "$srcdir/usr/share/applications/app.eduroam.geteduroam.desktop" \
        "$pkgdir/usr/share/applications/app.eduroam.geteduroam.desktop"

    # Install icons
    for path in "$srcdir"/usr/share/icons/hicolor/*/apps/app.eduroam.geteduroam.*; do
        install -Dm644 "$path" "$pkgdir/${path#$srcdir/}"
    done

    # Install license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
