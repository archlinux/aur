# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=playhouse-git
_pkgname=Playhouse
pkgver=1.0+2+g4b983b7
_commit=a9947bd8f8691a352a41b6534686ce48c4f6ece4
pkgrel=1
pkgdesc="A Playground for HTML/CSS/JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/sonnyp/Playhouse"
license=('GPL3')
depends=('libadwaita' 'webkit2gtk-5.0' 'gjs')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git
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
