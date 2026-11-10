# Maintainer: joegoldin <joe@joegold.in>
pkgname=zen-bonsai-browser-bin
_pkgname=zen-bonsai
pkgver=1.25t_bonsai.1
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
sha256sums=('f09d800ff823f8de79a84201dceacc0ef6d92828fc2ec770e729a4b7659726e1'
            'fffca8e74f7fa4f6b89f74361cae8ee3e9347cbe52dc46ce208484a35d5f3b1d')

package() {
  install -d "$pkgdir/usr/lib/$_pkgname"
  cp -r "$srcdir/zen/." "$pkgdir/usr/lib/$_pkgname"
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/zen" "$pkgdir/usr/bin/zen"
  install -Dm644 "$srcdir/zen.desktop" "$pkgdir/usr/share/applications/zen.desktop"
  install -Dm644 "$pkgdir/usr/lib/$_pkgname/browser/chrome/icons/default/default128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/zen.png"
}
