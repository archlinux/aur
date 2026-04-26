# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id="io.github.alainm23.$pkgname"
pkgver=4.19.1
pkgrel=1
pkgdesc="Task manager with Todoist and Nextcloud support"
arch=('x86_64')
url="https://useplanify.com"
license=('GPL-3.0-or-later')
depends=(
  'evolution-data-server'
  'gtk4'
  'gtksourceview5'
  'gxml'
  'icu'
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
sha256sums=('9aeb970d319946a722069ad6812f13750ab9d6a1aca13781afe238890302a4be'
            'd331bbd14369fc45ffe24fabbddaa1b7f994e5ae68d06720e31d89dd7ed003fc')

prepare() {
  cd "$pkgname"

  # Adjust Quick Add command
  patch -Np1 -i ../quick-add.patch
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  appstreamcli validate --no-net "build/data/${_app_id}.metainfo.xml"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/bin/${_app_id}.quick-add" "$pkgdir/usr/bin/$pkgname.quick-add"
}
