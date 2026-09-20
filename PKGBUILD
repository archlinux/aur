# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
pkgname=skimmer-for-linux
_pkgtag=0.5.0
pkgver=0.5.0
pkgrel=1
pkgdesc="Native GTK4/libadwaita multi-channel CW/RTTY skimmer (TCI client, spots, telnet cluster feed)"
arch=('x86_64')
url="https://github.com/OK1BR/skimmer-for-linux"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'libwebsockets' 'fftw' 'curl')
# desktop-file-utils + gtk-update-icon-cache: gnome.post_install wants both
# tools at meson-configure time even though DESTDIR skips the actual refresh.
makedepends=('meson' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
# From the published tag tarball:
#   curl -sL <url>/archive/refs/tags/v0.5.0.tar.gz | sha256sum
sha256sums=('e9beda6dc41944933436490ee954935b91669672477732cf93601bf30b19127d')

build() {
  arch-meson "$pkgname-$_pkgtag" build
  meson compile -C build
}

check() {
  # SKIM_DEEPCW_SYNC=1: v0.5.0's meson.build does not yet set it for the
  # deepcw gate, and without it the gate's TX-hold checks race the backend's
  # inference workers (17 failures in 20 runs). Set here so `makepkg` is
  # reproducible on the released tarball; from the next tag the gate carries
  # the setting itself and this line can go.
  SKIM_DEEPCW_SYNC=1 meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$_pkgtag/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
