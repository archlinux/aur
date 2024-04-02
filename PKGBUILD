# Maintainer: tytan652	<tytan652 at tytanium dot xyz>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
pkgver=1.8
_commit=ff603d64620fb48ff6f0424ff9d5d1b184b881dc
pkgrel=2
pkgdesc="Application/browser chooser"
arch=('any')
url="https://github.com/sonnyp/Junction"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'dconf'
  'hicolor-icon-theme'
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'gjs'
)
makedepends=('git' 'meson' 'python-gobject' 'blueprint-compiler')
#checkdepends=('appstream-glib')
source=(
  "${pkgname}::git+$url#commit=$_commit"
  'git+https://github.com/sonnyp/troll.git')
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd $pkgname
  git config submodule.src/troll.url "$srcdir/troll"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

# Appstream data is made with Flathub fork of appstream-glib
#check() {
#  meson test -C build --print-errorlogs || :
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
