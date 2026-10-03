# Maintainer: Dresden Wildey <dresden196@gmail.com>
pkgname=stoke
# fubuki was this package's name up to 0.2.3.
provides=('fubuki')
conflicts=('fubuki')
replaces=('fubuki')
pkgver=0.3.0
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the engine and command line"
arch=('any')
url="https://github.com/dresden196/stoke"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyudev' 'util-linux' 'dosfstools' 'ntfs-3g' 'exfatprogs' 'e2fsprogs'
         'grub' 'wimlib' 'hivex' 'polkit')
makedepends=('gettext')
# The payload (Syslinux modules, boot images) is data, not binaries to strip.
options=('!strip' '!debug')
optdepends=('zstd: writing .zst compressed images'
            'python-gobject: the udisks2 backend (writing without root, used by the Flatpak and AppImage)'
            'stoke-qt: the KDE window'
            'stoke-gtk: the GNOME window')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dresden196/stoke/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e48bd1730791197ee7705cd6853e2d87e84cece6fcd2e944b160417f5d778d8')

package() {
    cd "$srcdir/stoke-$pkgver/stoke"
    install -Dm755 bin/stoke "$pkgdir/usr/bin/stoke"
    ln -s stoke "$pkgdir/usr/bin/fubuki"
    install -d "$pkgdir/usr/lib/stoke/stoke"
    install -Dm644 stoke/*.py -t "$pkgdir/usr/lib/stoke/stoke/"
    install -d "$pkgdir/usr/share/stoke"
    cp -r payload/. "$pkgdir/usr/share/stoke/"
    find "$pkgdir/usr/share/stoke" -type f -exec chmod 644 {} +
    install -Dm644 io.github.dresden196.stoke.policy \
        "$pkgdir/usr/share/polkit-1/actions/io.github.dresden196.stoke.policy"
    install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/stoke/PROTOCOL.md"
    # The app icon lives with the engine: both windows depend on it.
    install -Dm644 icons/stoke.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/stoke.svg"
    install -Dm644 README.md "$pkgdir/usr/share/doc/stoke/README.md"
    for po in po/*/stoke.po; do
        lang=$(basename "$(dirname "$po")")
        install -d "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
        msgfmt -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/stoke.mo" "$po"
    done
}
