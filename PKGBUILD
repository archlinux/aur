# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=planify
_app_id="io.github.alainm23.$pkgname"
pkgver=4.12.0
pkgrel=2
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
        'quick-add.patch'
        'use-static-cast.patch')
sha256sums=('919b6352ffccc526db0874dbba110eed77a0789936e3a6a6434221a13ec3dfe7'
            '7dbb298442c04502521835581acc454d3a3085b81161ca0bfb3d04e5f01c69a2'
            'aa668bee34405c56c941680bac172567bf94bc46fe807d90d001149360804400')

prepare() {
  cd "$pkgname"

  # Adjust Quick Add command
  patch -Np1 -i ../quick-add.patch

  # use static cast from EventControllerKey to ShortcutController
  # https://github.com/alainm23/planify/issues/1551
  # https://github.com/alainm23/planify/pull/1552
  patch -Np1 -i ../use-static-cast.patch
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
