# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id=io.github.alainm23.planify
pkgver=4.8.4
pkgrel=1
pkgdesc="Task manager with Todoist and Nextcloud support"
arch=('x86_64')
url="https://github.com/alainm23/planify"
license=('GPL-3.0-or-later')
depends=(
  'evolution-data-server'
  'granite7'
  'gtksourceview5'
  'gxml'
  'libadwaita'
  'libportal-gtk4'
  'webkitgtk-6.0'
)
makedepends=(
  'gobject-introspection'
  'meson'
  'vala'
)
conflicts=('elementary-planner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a42131d65c8cb594ea736867ed1058e339839b9e39e8b3b3cd0abb2496dd0656')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  appstreamcli validate --no-net "build/data/${_app_id}.appdata.xml" || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
