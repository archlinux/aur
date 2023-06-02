# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id=io.github.alainm23.planify
pkgver=3.0.7+47+g696fb7ab
pkgrel=1
pkgdesc="Task manager with Todoist support (Development version)"
arch=('x86_64')
url="https://useplanner.com"
license=('GPL3')
depends=('evolution-data-server' 'granite7' 'gtksourceview5' 'libadwaita'
         'webkitgtk-6.0')
makedepends=('git' 'gobject-introspection' 'meson' 'vala')
checkdepends=('appstream')
conflicts=('elementary-planner')
replaces=('elementary-planner')
_commit=696fb7ab3c66ea4a14a5167cb5b44e9444294ecb  # 4.0 beta on FlatHub
source=("git+https://github.com/alainm23/planner.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd planner
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson planner build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs

  appstreamcli validate --no-net "build/data/${_app_id}.appdata.xml" || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/planify"
}
