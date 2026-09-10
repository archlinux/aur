# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=fubuki
pkgver=0.1.1
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the engine and command line"
arch=('any')
url="https://github.com/dresden196/fubuki"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyudev' 'util-linux' 'dosfstools' 'ntfs-3g' 'exfatprogs' 'e2fsprogs'
         'syslinux' 'grub' 'wimlib' 'hivex' 'parted' 'polkit')
makedepends=('gettext')
optdepends=('zstd: writing .zst compressed images'
            'fubuki-ui: the KDE window'
            'fubuki-gtk: the GNOME window')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dresden196/fubuki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a64af150cbf60a49d5e62bfff0cbbd76b80c6d2f6f99fa383c2c9bfee11398b5')

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
    install -Dm644 README.md "$pkgdir/usr/share/doc/fubuki/README.md"
    for po in po/*/fubuki.po; do
        lang=$(basename "$(dirname "$po")")
        install -d "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/fubuki.mo" "$po"
    done
}
