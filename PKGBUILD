# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=commit
pkgver=4.2
pkgrel=1
pkgdesc="Commit message editor."
arch=('any')
url="https://apps.gnome.org/Commit"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'libspelling'
  'gjs'
  'gtksourceview5'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
optdepends=(
  'git: git support'
  'mercurial: mercurial support'
)
source=("git+https://github.com/sonnyp/Commit.git#tag=v$pkgver"
        'git+https://github.com/sonnyp/troll.git')
sha256sums=('1ea5596a4cfc49fa57317f0d439c01ad249521a2b10a0e0c6e572aa769bac950'
            'SKIP')

prepare() {
  cd Commit
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson Commit build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
