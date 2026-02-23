# Maintainer: Mohammed El-sayed Ahmed <MohammedEl-sayedAhmed@users.noreply.github.com>
pkgname=clipman-clipboard
pkgver=1.0.0
pkgrel=1
pkgdesc="A clipboard history manager for GNOME on Wayland"
arch=('any')
url="https://github.com/MohammedEl-sayedAhmed/clipman"
license=('Apache-2.0')
depends=(
    'python>=3.10'
    'python-gobject'
    'python-dbus'
    'gtk3'
    'wl-clipboard'
    'gnome-shell'
)
_srcname=clipman
source=("$_srcname-$pkgver.tar.gz::https://github.com/MohammedEl-sayedAhmed/clipman/archive/v$pkgver.tar.gz")
sha256sums=('63042629bdc6404174ce11645f3470432a7dcb9a1395c6ef5f6706cf29e14538')

package() {
    cd "$srcdir/$_srcname-$pkgver"

    # Install Python package
    install -d "$pkgdir/opt/$_srcname"
    cp -r clipman clipman.py launcher.sh "$pkgdir/opt/$_srcname/"
    install -Dm644 clipman/style.css "$pkgdir/opt/$_srcname/clipman/style.css"

    # Install GNOME Shell extension
    local _extdir="$pkgdir/usr/share/gnome-shell/extensions/clipman@clipman.com"
    install -d "$_extdir"
    install -Dm644 extension/extension.js "$_extdir/extension.js"
    install -Dm644 extension/metadata.json "$_extdir/metadata.json"

    # Install desktop file (fix Exec path), icon, and systemd service
    sed "s|CLIPMAN_PATH_PLACEHOLDER|/opt/$_srcname|" data/com.clipman.Clipman.desktop \
        > "$srcdir/com.clipman.Clipman.desktop"
    install -Dm644 "$srcdir/com.clipman.Clipman.desktop" "$pkgdir/usr/share/applications/com.clipman.Clipman.desktop"
    install -Dm644 data/com.clipman.Clipman.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.clipman.Clipman.svg"
    install -Dm644 data/com.clipman.Clipman.metainfo.xml "$pkgdir/usr/share/metainfo/com.clipman.Clipman.metainfo.xml"
    install -Dm644 data/clipman.service "$pkgdir/usr/lib/systemd/user/clipman.service"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
