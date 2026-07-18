# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id="io.github.alainm23.$pkgname"
pkgver=4.19.5
pkgrel=1
_chrono_ver=1.0.0
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
        "git+https://github.com/alainm23/chrono.git#tag=${_chrono_ver}"
        'quick-add.patch')
sha256sums=('19646fa129263453d83e46b9fd2ee2e45b37aabe2140adbf9f5807223684b925'
            '6c36a5e2cbf4e03cf8d692e2045072221da2998820fadfb3514e29aed84072e2'
            'd331bbd14369fc45ffe24fabbddaa1b7f994e5ae68d06720e31d89dd7ed003fc')

prepare() {
  cd "$pkgname"
  ln -sf "$srcdir/chrono" subprojects/

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
