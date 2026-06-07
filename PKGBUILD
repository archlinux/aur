# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_app_id=io.github.flattool.Ignition
pkgver=2.4.1
pkgrel=2
pkgdesc="Manage startup apps and scripts"
arch=('any')
url="https://github.com/flattool/ignition"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'gtk4'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'typescript'
)
source=("git+https://github.com/flattool/ignition.git#tag=$pkgver"
        'git+https://github.com/flattool/gir-ts-types.git')
sha256sums=('7fcf6796bd3a84777512f11fae049f680408424d0590e4816377a6734c092b95'
            'SKIP')

prepare() {
  cd ignition
  git submodule init
  git config submodule.gi-types.url "$srcdir/gir-ts-types"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson ignition build -Dtests=false
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/io.github.flattool.Ignition "$pkgdir/usr/bin/ignition"
}
