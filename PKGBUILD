# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_app_id=io.github.flattool.Ignition
pkgver=2.4.0
pkgrel=1
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
  'jasmine-gjs'
  'meson'
  'typescript'
)
source=("git+https://github.com/flattool/ignition.git#tag=$pkgver"
        'git+https://github.com/flattool/gir-ts-types.git'
        'git+https://github.com/flattool/gobjectify.git')
sha256sums=('536b135c0f376c2617847f2adc20edd0c916d537b59f8c305f993e2c96b4e354'
            'SKIP'
            'SKIP')

prepare() {
  cd ignition
  git submodule init
  git config submodule.gi-types.url "$srcdir/gir-ts-types"
  git config submodule.src/gobjectify.url "$srcdir/gobjectify"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson ignition build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/io.github.flattool.Ignition "$pkgdir/usr/bin/ignition"
}
