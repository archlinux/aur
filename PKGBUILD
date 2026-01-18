# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_app_id=io.github.flattool.Ignition
pkgver=2.3.0
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
  'jasmine-gjs'
  'meson'
  'typescript'
)
source=("git+https://github.com/flattool/ignition.git#tag=$pkgver"
        'git+https://github.com/flattool/gir-ts-types.git'
        'git+https://github.com/flattool/gobjectify.git')
sha256sums=('629c3174abf18ad04c6daed90267a727c2a254ada274203497e658fa1d669672'
            'SKIP'
            'SKIP')

prepare() {
  cd ignition
  git submodule init
  git config submodule.gi-types.url "$srcdir/gir-ts-types"
  git config submodule.src/gobjectify.url "$srcdir/gobjectify"
  git -c protocol.file.allow=always submodule update

  # Move src/ and test/ output files to pkgdatadir instead of bin
  git cherry-pick -n 562a045eab0a1eb0674be6b3c5604a721eb52d84
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
