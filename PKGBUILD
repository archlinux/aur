# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
_app_id=io.github.flattool.Ignition
pkgver=2.3.0
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
        'git+https://github.com/flattool/gobjectify.git'
        "${_app_id}.sh")
sha256sums=('629c3174abf18ad04c6daed90267a727c2a254ada274203497e658fa1d669672'
            'SKIP'
            'SKIP'
            '17c12dc131eedf1337c3fdfb516f737a0f15f79d3addf1c6897fa245cb1e9de4')

prepare() {
  cd ignition
  git submodule init
  git config submodule.gi-types.url "$srcdir/gir-ts-types"
  git config submodule.src/gobjectify.url "$srcdir/gobjectify"
  git -c protocol.file.allow=always submodule update

  # install files in /usr/share/ignition/ not /usr/bin/
  sed -i "s/install_dir: get_option('bindir')/install_dir: pkgdatadir/g" \
    src/meson.build tests/meson.build
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

  install -Dm755 "$srcdir/${_app_id}.sh" "$pkgdir/usr/bin/${_app_id}"
  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/ignition"
}
