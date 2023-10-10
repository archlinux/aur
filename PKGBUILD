# Maintainer: Angelo Verlain SHEMA (https://vixalien.com)
pkgname=decibels
pkgver=0.1.4
pkgrel=1
pkgdesc="Play audio files"
arch=('any')
url="https://github.com/vixalien/decibels"
license=('GPL-3.0')
depends=('gjs' 'libadwaita')
makedepends=('git' 'gobject-introspection' 'meson' 'typescript')
checkdepends=('appstream-glib')
_commit=0b130b2bbc919d5f266b131f917c4bdd34b069e0  # tags/v0.1.4^0
source=("git+https://github.com/vixalien/decibels.git#commit=$_commit"
        'git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/decibels"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/decibels"
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always submodule update

  # Fix build:
  sed -i "s/tsc, '--outDir'/tsc, '--project', files('..\/tsconfig.json'), '--outDir'/g" src/meson.build
}

build() {
  arch-meson decibels build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$srcdir/decibels"
  install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname/"

  ln -s "$pkgdir/usr/bin/com.vixalien.decibels" "$pkgdir/usr/bin/$pkgname"
}
