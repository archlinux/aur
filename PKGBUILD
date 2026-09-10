# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=fubuki-gtk
_base=fubuki
pkgver=0.2.3
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the GNOME window"
arch=('any')
url="https://github.com/dresden196/fubuki"
license=('GPL-3.0-or-later')
depends=('fubuki' 'python' 'python-gobject' 'gtk4' 'libadwaita' 'polkit')
makedepends=('gettext')
source=("$_base-$pkgver.tar.gz::https://github.com/dresden196/fubuki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('69a2b4d4bc15cfc907086d8c2938215ff1267bb8cebb94db9ffd49b64d9a587b')

package() {
    cd "$srcdir/$_base-$pkgver/fubuki-gtk"
    install -Dm755 bin/fubuki-gtk "$pkgdir/usr/bin/fubuki-gtk"
    install -d "$pkgdir/usr/lib/fubuki-gtk/fubuki_gtk"
    install -Dm644 fubuki_gtk/*.py -t "$pkgdir/usr/lib/fubuki-gtk/fubuki_gtk/"
    install -Dm644 io.github.dresden196.fubuki.gtk.desktop \
        "$pkgdir/usr/share/applications/io.github.dresden196.fubuki.gtk.desktop"
    install -Dm644 io.github.dresden196.fubuki.gtk.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.dresden196.fubuki.gtk.metainfo.xml"
    # The icon comes with the engine package, which both windows depend on.
    for po in po/*/fubuki-gtk.po; do
        [ -f "$po" ] || continue
        lang=$(basename "$(dirname "$po")")
        install -d "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/fubuki-gtk.mo" "$po"
    done
}
