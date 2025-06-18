# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id="io.github.alainm23.$pkgname"
pkgver=4.12.2
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
conflicts=('elementary-planner')
source=("git+https://github.com/alainm23/planify.git#tag=$pkgver"
        'quick-add.patch')
sha256sums=('adfa9d5f317d7f899906c45cf59c89835c5b6dd01d0592abd67ba6dbad649c97'
            '7dbb298442c04502521835581acc454d3a3085b81161ca0bfb3d04e5f01c69a2')

prepare() {
  cd "$pkgname"

  # Adjust Quick Add command
  patch -Np1 -i ../quick-add.patch
}

build() {
  arch-meson "$pkgname" build -Dprofile=default
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
