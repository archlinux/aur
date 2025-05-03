# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=ignition-startup
pkgver=2.1.0
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
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('45b70d01b96b6d538fa42cfd110c062c263d7118b52249bbc3eb8538bc697c7e'
            'SKIP')

prepare() {
  cd ignition
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
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
