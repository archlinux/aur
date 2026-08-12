# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
pkgname=skimmer-for-linux
_pkgtag=0.2.0
pkgver=0.2.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita multi-channel CW skimmer (TCI client, spots, telnet cluster feed)"
arch=('x86_64')
url="https://github.com/OK1BR/skimmer-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'libwebsockets' 'fftw')
# desktop-file-utils + gtk-update-icon-cache: gnome.post_install wants both
# tools at meson-configure time even though DESTDIR skips the actual refresh.
makedepends=('meson' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
# From the published tag tarball:
#   curl -sL <url>/archive/refs/tags/v0.2.0.tar.gz | sha256sum
sha256sums=('4f35ab491f3a176ef397a350067243f9d197fdfaf0e50d6ca7c739910f770122')

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
