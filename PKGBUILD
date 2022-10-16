# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction-git
_pkgname=Junction
pkgver=1.6.r0.gc9da76c
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git
	'git+https://github.com/sonnyp/troll.git')
b2sums=('SKIP'
	'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git submodule update
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
