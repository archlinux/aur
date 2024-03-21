# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=sticky-notes
pkgver=0.2.5
pkgrel=1
pkgdesc="A simple sticky notes app"
arch=('any')
url="https://github.com/vixalien/sticky"
license=('MIT')
depends=('gjs' 'libadwaita')
makedepends=('git' 'gobject-introspection' 'meson' 'yarn')
checkdepends=('appstream')
_commit=73c9000a406d92bf15ccb574aa871f5c69fcb014  # tags/v0.2.5^0
source=("git+https://github.com/vixalien/sticky.git#commit=$_commit"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd sticky
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd sticky
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  # Correct version:
  sed -i "s/0.2.1/$pkgver/g" meson.build
}

build() {
  export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
  yarn install

  arch-meson sticky build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  install -Dm644 sticky/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s /usr/bin/com.vixalien.sticky "$pkgdir/usr/bin/$pkgname"
}
