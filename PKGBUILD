# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adwsteamgtk
pkgver=0.9.2
pkgrel=1
pkgdesc="A simple Gtk wrapper for Adwaita-for-Steam"
arch=('any')
url="https://github.com/Foldex/AdwSteamGtk"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'python-gobject'
  'python-packaging'
)
makedepends=(
  'blueprint-compiler'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed73c560c0ed14d2c3ac9ab220ab51b39560f9cd3a97270c47e475c9539b3efa')

build() {
  arch-meson "AdwSteamGtk-$pkgver" build
  meson compile -C build
}

check() {

  # Only validate schema & desktop file
  meson test -C build "Validate schema file" "Validate desktop file" --no-rebuild --print-errorlogs

  # Use appstreamcli instead of failing with appstream-util
  appstreamcli validate --no-net build/data/io.github.Foldex.AdwSteamGtk.appdata.xml
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
