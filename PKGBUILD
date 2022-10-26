# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=playhouse-git
pkgver=1.0.r2.g4b983b7
pkgrel=1
pkgdesc="A Playground for HTML/CSS/JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/sonnyp/Playhouse"
license=('GPL3')
depends=('libadwaita' 'webkit2gtk-5.0' 'gjs')
makedepends=('git' 'blueprint-compiler' 'python-gobject' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git"
  'git+https://github.com/sonnyp/troll.git')
b2sums=('SKIP'
  'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update --init --recursive

  # This is not a Flatpak
  sed -i 's|app/bin|usr/bin|g' src/meson.build
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
