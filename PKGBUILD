# Maintainer: Hernan Lozano <hernantz@gmail.com>
#
# pkgver is set by `make release`; the release workflow fills in sha256sums
# from the tag's tarball and pushes this file, with its .SRCINFO, to the AUR.
pkgname=timezones
pkgver=1.1.0
pkgrel=1
pkgdesc="World time clocks with native GTK4 UI"
arch=('any')
url="https://github.com/hernantz/timezones"
license=('GPL-3.0-or-later')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'libadwaita'
  'adwaita-icon-theme'
  # Zone coordinates and countries are read from zone.tab/iso3166.tab.
  'tzdata'
  # City search and translated city names.
  'libgweather-4'
)
makedepends=('meson' 'glib2-devel')
checkdepends=('desktop-file-utils' 'appstream')
optdepends=('iso-codes: translated country names')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c225e5ad0c56796443693ada40d7ccc499809b75c3b4d17d9aede9f72e2002c')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  desktop-file-validate build/io.github.hernantz.timezones.desktop
  appstreamcli validate --no-net build/io.github.hernantz.timezones.metainfo.xml
}

package() {
  meson install -C build --destdir "$pkgdir"
}
