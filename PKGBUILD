# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=fubuki
pkgver=0.2.2
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the engine and command line"
arch=('any')
url="https://github.com/dresden196/fubuki"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyudev' 'util-linux' 'dosfstools' 'ntfs-3g' 'exfatprogs' 'e2fsprogs'
         'grub' 'wimlib' 'hivex' 'polkit')
makedepends=('gettext')
optdepends=('zstd: writing .zst compressed images'
            'python-gobject: the udisks2 backend (writing without root, used by the Flatpak and AppImage)'
            'fubuki-qt: the KDE window'
            'fubuki-gtk: the GNOME window')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dresden196/fubuki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3169c08c23d007b766211231a0194b38fdaabc59faf8f99bd3c86c8ae582eb4')

package() {
    cd "$srcdir/fubuki-$pkgver/fubuki"
    install -Dm755 bin/fubuki "$pkgdir/usr/bin/fubuki"
    install -d "$pkgdir/usr/lib/fubuki/fubuki"
    install -Dm644 fubuki/*.py -t "$pkgdir/usr/lib/fubuki/fubuki/"
    install -d "$pkgdir/usr/share/fubuki"
    cp -r payload/. "$pkgdir/usr/share/fubuki/"
    find "$pkgdir/usr/share/fubuki" -type f -exec chmod 644 {} +
    install -Dm644 io.github.dresden196.fubuki.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.dresden196.fubuki.policy"
    install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/fubuki/PROTOCOL.md"
    # The app icon lives with the engine: both windows depend on it.
    install -Dm644 icons/fubuki.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/fubuki.svg"
    install -Dm644 README.md "$pkgdir/usr/share/doc/fubuki/README.md"
    for po in po/*/fubuki.po; do
        lang=$(basename "$(dirname "$po")")
        install -d "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/fubuki.mo" "$po"
    done
}
