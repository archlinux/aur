pkgname=exhibit
pkgver=1.6.1
pkgrel=1
pkgdesc='3D model viewer for the GNOME desktop powered by F3D'
arch=('any')
url='https://github.com/Nokse22/Exhibit'
license=('GPL-3.0-or-later')
depends=(
  'f3d'
  'libadwaita'
  'python-gobject'
  'python-wand'
)
optdepends=('yelp: view the built-in help')
makedepends=(
  'git'
  'meson'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=(
  "Exhibit-$pkgver::git+$url.git#tag=v$pkgver"
  'exhibit.sh'
)
sha256sums=(
  'SKIP'
  'b95a67538328deade77a8006708fb1ef90aa78833e28307d7989aa948d200d09'
)

prepare() {
  sed -i "s/version: '1.6.0'/version: '$pkgver'/" "Exhibit-$pkgver/meson.build"
}

build() {
  arch-meson "Exhibit-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm "$pkgdir/usr/share/exhibit/exhibit/"{exhibit.in,meson.build}
  install -Dm755 "$pkgdir/usr/bin/exhibit" "$pkgdir/usr/lib/exhibit/exhibit"
  install -Dm755 exhibit.sh "$pkgdir/usr/bin/exhibit"
}
