# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sticky-notes
pkgver=0.2.6
pkgrel=1
pkgdesc="A simple sticky notes app"
arch=('any')
url="https://github.com/vixalien/sticky"
license=('MIT')
depends=(
  'gjs'
  'libadwaita'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
  'yarn'
)
source=("git+https://github.com/vixalien/sticky.git#tag=v$pkgver"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('59b83ce854580cedda5b2ac9e7ed52a3904dca713329fb0c10abc2ba95b3031d'
            'SKIP')

prepare() {
  cd sticky
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update
}

build() {
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install

  arch-meson sticky build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  install -Dm644 sticky/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s /usr/bin/com.vixalien.sticky "$pkgdir/usr/bin/$pkgname"
}
