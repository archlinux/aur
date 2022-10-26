# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=playhouse
pkgver=1.0
_commit=287811d971872b51bb6127a35610d1442e15b1f4
pkgrel=2
pkgdesc="A Playground for HTML/CSS/JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/sonnyp/Playhouse"
license=('GPL3')
depends=('libadwaita' 'webkit2gtk-5.0' 'gjs')
makedepends=('git' 'blueprint-compiler' 'python-gobject' 'meson')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}::git+$url#commit=$_commit"
  'git+https://github.com/sonnyp/troll.git')
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update --init --recursive

  # This is not a Flatpak
  sed -i 's|app/bin|usr/bin|g' src/meson.build
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
