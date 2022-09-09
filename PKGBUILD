# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction-git
_pkgname=Junction
pkgver=r189.59270f4
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson')
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
  ( set -o pipefail
    git de_pkgnamescribe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
