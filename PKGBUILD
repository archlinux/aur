# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
pkgver=2.2.0
pkgrel=1
pkgdesc="Manage startup apps and scripts"
arch=('any')
url="https://github.com/flattool/ignition"
license=('GPL-3.0-or-later')
depends=(
  'gjs'
  'libadwaita'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'typescript'
)
source=("git+https://github.com/flattool/ignition.git#tag=$pkgver"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git'
        'ignore-deprecations.patch')
sha256sums=('569b408d26762e8f0d37c8c0e2091fd02d7dd08dbf0acf12d0f5f5fff785cb49'
            'SKIP'
            'bdcd8cc89daf461e422093f8e47d083d3971de6e5a28d0c455f9aded40a855f6')

prepare() {
  cd ignition
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  # error TS5107: Option 'moduleResolution=node10' is deprecated and will stop functioning in TypeScript 7.0
  patch -Np1 -i ../ignore-deprecations.patch
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
