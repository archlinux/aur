# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id=io.github.alainm23.planify
pkgver=4.5.2
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
  'git'
  'gobject-introspection'
  'meson'
  'vala'
)
checkdepends=('appstream')
conflicts=('elementary-planner')
replaces=('elementary-planner')
_commit=5796e5ad809a9ff549468d0e41a5317bc04f7690  # tags/4.5.2^0
source=("git+https://github.com/alainm23/planify.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$pkgname"
}

build() {
  arch-meson "$pkgname" build -Dprofile=default
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  appstreamcli validate --no-net "build/data/${_app_id}.appdata.xml"
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
