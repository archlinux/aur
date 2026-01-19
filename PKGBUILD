# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_app_id=io.github.flattool.Ignition
pkgver=2.3.1
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
sha256sums=('7eb4894b43ce5b976c07b44e0ce54f24b7c92bae1b684fdaecfb164e1b9d7d8b'
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
