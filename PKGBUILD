# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=playhouse
_pkgname=Playhouse
pkgver=1.0
_commit=287811d971872b51bb6127a35610d1442e15b1f4
pkgrel=1
pkgdesc="A Playground for HTML/CSS/JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/sonnyp/Playhouse"
license=('GPL3')
depends=('libadwaita' 'webkit2gtk-5.0' 'gjs')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("git+https://github.com/sonnyp/Playhouse.git#commit=${_commit}"
        'git+https://github.com/sonnyp/troll.git')
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git submodule update

  # This is not a Flatpak
  sed -i 's|app/bin|usr/bin|g' "$srcdir/$_pkgname"/src/meson.build
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
