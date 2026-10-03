# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=stoke-gtk
# fubuki-gtk was this package's name up to 0.2.3.
provides=('fubuki-gtk')
conflicts=('fubuki-gtk')
replaces=('fubuki-gtk')
_base=stoke
pkgver=0.3.0
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the GNOME window"
arch=('any')
url="https://github.com/dresden196/stoke"
license=('GPL-3.0-or-later')
depends=('stoke' 'python' 'python-gobject' 'gtk4' 'libadwaita' 'polkit')
makedepends=('gettext')
source=("$_base-$pkgver.tar.gz::https://github.com/dresden196/stoke/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e48bd1730791197ee7705cd6853e2d87e84cece6fcd2e944b160417f5d778d8')

package() {
    cd "$srcdir/$_base-$pkgver/stoke-gtk"
    install -Dm755 bin/stoke-gtk "$pkgdir/usr/bin/stoke-gtk"
    ln -s stoke-gtk "$pkgdir/usr/bin/fubuki-gtk"
    install -d "$pkgdir/usr/lib/stoke-gtk/stoke_gtk"
    install -Dm644 stoke_gtk/*.py -t "$pkgdir/usr/lib/stoke-gtk/stoke_gtk/"
    install -Dm644 io.github.dresden196.stoke.gtk.desktop \
        "$pkgdir/usr/share/applications/io.github.dresden196.stoke.gtk.desktop"
    install -Dm644 io.github.dresden196.stoke.gtk.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.dresden196.stoke.gtk.metainfo.xml"
    # The icon comes with the engine package, which both windows depend on.
    for po in po/*/stoke-gtk.po; do
        [ -f "$po" ] || continue
        lang=$(basename "$(dirname "$po")")
        install -d "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/stoke-gtk.mo" "$po"
    done
}
