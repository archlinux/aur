# Maintainer: Richard Fakenberg (OK1BR) <rifak@protonmail.com>
# AUR package for the tagged release.
pkgname=radio-noise-key-generator
_pkgtag=0.1.0
pkgver=0.1.0
pkgrel=1
pkgdesc="Passwords and keys from RTL-SDR radio noise — SP 800-90B health tests, measured entropy credit, SHAKE-256, getrandom() always mixed in"
arch=('x86_64')
url="https://github.com/OK1BR/radio-noise-key-generator"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glib2' 'libgcrypt' 'rtl-sdr')
# desktop-file-utils + gtk-update-icon-cache: gnome.post_install wants both
# tools at meson-configure time even though DESTDIR skips the actual refresh.
makedepends=('meson' 'desktop-file-utils' 'gtk-update-icon-cache')
source=("$pkgname-$_pkgtag.tar.gz::$url/archive/refs/tags/v$_pkgtag.tar.gz")
# From the published tag tarball:
#   curl -sL <url>/archive/refs/tags/v0.1.0.tar.gz | sha256sum
sha256sums=('5521d04bdc76fd863eb75e878e90c486fb61690e8099d371ab755980d7abedae')

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
