# Maintainer: joegoldin <joe@joegold.in>
pkgname=zen-bonsai-browser-bin
_pkgname=zen-bonsai
pkgver=1.24.1b_bonsai.1
pkgrel=1
pkgdesc="Zen Bonsai: an unofficial fork of Zen Browser with native tree-style tabs"
arch=('x86_64')
url="https://github.com/joegoldin/zen-bonsai-browser"
license=('MPL-2.0')
# The fork keeps upstream's binaryName, so it owns the same /usr/bin/zen.
# Without these, pacman fails the install with a bare file-conflict error.
# zen-browser-tst-bin is this package's name before the rename.
conflicts=('zen-browser' 'zen-browser-bin' 'zen-browser-tst-bin')
provides=("zen-browser=${pkgver}")
replaces=('zen-browser-tst-bin')
depends=('gtk3' 'libxt' 'mime-types' 'dbus-glib' 'nss' 'ttf-font' 'libpulse')
options=('!strip')
# The release asset is named zen.linux-x86_64.tar.xz for every version, so the
# download is renamed per version here. Without that, makepkg's source cache
# keys on the bare filename and silently reuses the previous release's tarball
# under the new version number.
source=("$pkgname-$pkgver.tar.xz::https://github.com/joegoldin/zen-bonsai-browser/releases/download/${pkgver//_/-}/zen.linux-x86_64.tar.xz"
        "zen.desktop")
# The release job's updpkgsums rewrites both entries against the published
# tarball before anything is pushed to the AUR; the first one cannot be known
# until that release exists.
sha256sums=('3912a9afa8e41d105f83a95b512a71140974e743775605d9bd39d17ab0ee5fac'
            '05529f659ed3810d81cb2660c19365f4893fd4641261b7802c5cc22ee9c729b6')

package() {
  install -d "$pkgdir/opt/$_pkgname"
  cp -r "$srcdir/zen/." "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/zen" "$pkgdir/usr/bin/zen"
  install -Dm644 "$srcdir/zen.desktop" "$pkgdir/usr/share/applications/zen.desktop"
  install -Dm644 "$pkgdir/opt/$_pkgname/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/zen.png"
}
