# Maintainer: Nick <evilnick002 at gmail dot com>
pkgname=orpheus-desktop-bin
pkgver=1.5.1
pkgrel=1
pkgdesc="Desktop app for the Orpheus Discord music bot, with the full dashboard, media controls and a tray remote"
arch=('x86_64')
url="https://orpheus.evilnick.net"
license=('Apache-2.0')
# libayatana-appindicator is loaded at run time for the tray icon, so namcap
# cannot see it.
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libgcc'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=('orpheus-desktop')
conflicts=('orpheus-desktop')

source=("$pkgname-$pkgver.deb::https://downloads.evilnick.net/orpheus-desktop/$pkgver/Orpheus_${pkgver}_amd64.deb")
sha256sums=('d6c40cb98e14745c9f70ba02af56af48ea3fb9034cc88d19893377b456d54d73')

prepare() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar -xf data.tar.gz 2>/dev/null \
        || tar -xf data.tar.zst 2>/dev/null \
        || tar -xf data.tar.xz
}

package() {
    cd "$srcdir"

    install -Dm755 usr/bin/orpheus-desktop "$pkgdir/usr/bin/orpheus-desktop"

    # Named after the binary, which is the Wayland app id, so the window
    # gets its icon.
    install -Dm644 usr/share/applications/Orpheus.desktop \
        "$pkgdir/usr/share/applications/orpheus-desktop.desktop"

    for size in 32x32 128x128 256x256@2 512x512; do
        install -Dm644 "usr/share/icons/hicolor/$size/apps/orpheus-desktop.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/orpheus-desktop.png"
    done

    # Tells the app it was installed from the AUR, so it never offers to
    # update itself.
    install -Dm644 /dev/null "$pkgdir/usr/share/orpheus-desktop/aur"
}
