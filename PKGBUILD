# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id=io.github.alainm23.planify
pkgver=4.1.4
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
_commit=73fd6cb7acfc60937d1403238c255736b97aa94b  # 4.1.4
source=("git+https://github.com/alainm23/planify.git#commit=$_commit")
sha256sums=('SKIP')

#pkgver() {
#  cd "$pkgname"
#  git describe --tags | sed 's/-/+/g'
#}

prepare() {
  cd "$pkgname"

  # Bump version in WhatsNew dialog
  sed -i "s/Version 4.1.1/Version $pkgver/g" src/Dialogs/WhatsNew.vala
}

build() {
  arch-meson "$pkgname" build
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
