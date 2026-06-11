# Maintainer: Yaroslav Krytsun <slavko7 at gmail dot com>
pkgname=dyedfox-radio
pkgver=0.4.6
pkgrel=1
pkgdesc="Desktop internet radio player for KDE Plasma"
arch=('any')
url="https://github.com/dyedfox/dyedfox-radio"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-dbus'
    'python-gobject'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
)
optdepends=(
    'gst-plugins-bad: additional codec support'
    'gst-libav: AAC and other codec support'
)
makedepends=('git' 'qt6-tools')
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    for ts in translations/*.ts; do
        lrelease6 "$ts"
    done
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r api data player tray ui assets main.py "$pkgdir/usr/lib/$pkgname/"

    install -dm755 "$pkgdir/usr/lib/$pkgname/translations"
    for qm in translations/*.qm; do
        [ -f "$qm" ] && install -m644 "$qm" "$pkgdir/usr/lib/$pkgname/translations/"
    done

    install -Dm644 "assets/icons/$pkgname.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    install -Dm644 "assets/icons/$pkgname-tray.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname-tray.svg"

    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'LAUNCHER'
#!/bin/sh
exec python3 /usr/lib/dyedfox-radio/main.py "$@"
LAUNCHER
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
