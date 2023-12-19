# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id=io.github.alainm23.planify
pkgver=4.3.1
pkgrel=1
pkgdesc="Task manager with Todoist support"
arch=('x86_64')
url="https://github.com/alainm23/planify"
license=('GPL3')
depends=('evolution-data-server' 'granite7' 'gtksourceview5' 'libadwaita'
         'libportal-gtk4' 'webkitgtk-6.0')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
checkdepends=('appstream')
conflicts=('elementary-planner')
replaces=('elementary-planner')
_commit=41d8957b785ac1d07c2f2f4088428db9326e29b4  # tags/4.3.1^0
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

  appstreamcli validate --no-net "build/data/${_app_id}.appdata.xml" || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
