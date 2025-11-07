# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id="io.github.alainm23.$pkgname"
pkgver=4.15.2
pkgrel=1
pkgdesc="Task manager with Todoist and Nextcloud support"
arch=('x86_64')
url="https://useplanify.com"
license=('GPL-3.0-or-later')
depends=(
  'evolution-data-server'
  'granite7'
  'gtk4'
  'gtksourceview5'
  'gxml'
  'json-glib'
  'libadwaita'
  'libgee'
  'libical'
  'libportal'
  'libportal-gtk4'
  'libsecret'
  'libsoup3'
  'libspelling'
  'sqlite'
  'webkitgtk-6.0'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
  'vala'
)
conflicts=('elementary-planner')
source=("git+https://github.com/alainm23/planify.git#tag=v$pkgver"
        'quick-add.patch')
sha256sums=('e3047ad9c70c3fa2a2957044853e7c3fdfe4e3a80c8197d9c963fd29d1e2a1ba'
            'd604c920c18d40a2ba5f972494c56095c369d04f305ea3523f90813ed978a038')

prepare() {
  cd "$pkgname"

  # Adjust Quick Add command
  patch -Np1 -i ../quick-add.patch

  # Don't prompt to update from FlatHub
  sed -i 's/latest_release.version != Build.VERSION/latest_release.version >= Build.VERSION/g' \
    src/Layouts/Sidebar.vala
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  appstreamcli validate --no-net "build/data/${_app_id}.appdata.xml"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/${_app_id}.quick-add" "$pkgdir/usr/bin/$pkgname.quick-add"
}
