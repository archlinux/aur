# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release — aur.archlinux.org/packages/log-for-linux
# Bump: raise _pkgtag, `updpkgsums`, verify with a full makepkg (check() runs
# the meson gates), then push this file plus `makepkg --printsrcinfo > .SRCINFO`
# to ssh://aur@aur.archlinux.org/log-for-linux.git.
pkgname=log-for-linux
_pkgtag=0.3.1
pkgver=0.3.1
pkgrel=1
pkgdesc="Native GTK4/libadwaita ham radio logbook (ADIF, contests, Cabrillo, TCI, WSJT-X)"
arch=('x86_64')
url="https://github.com/OK1BR/log-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'sqlite' 'libwebsockets')
# desktop-file-utils + gtk-update-icon-cache: gnome.post_install wants both
# tools at meson-configure time even though DESTDIR skips the actual refresh.
makedepends=('meson' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
sha256sums=('8f63403f1fe98bc82cc7b0c40f66a7ffb1e9e5a27403206612b990c4948d3edb')

build() {
  arch-meson "$pkgname-$_pkgtag" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$_pkgtag/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
