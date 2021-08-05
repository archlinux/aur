# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=palette-git
pkgver=2.0.1.r2.g27c60fa
pkgrel=2
pkgdesc="Tool for viewing the GNOME color palette as defined by the design guidelines"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/palette"
license=('GPL3')
depends=('gtk4' 'vala')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+$url.git"
  "git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
md5sums=(
  'SKIP'
  'SKIP') #autofill using updpkgsums

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mv HIG-app-icons/GNOME\ HIG.gpl ${pkgname%-git}/src/hig/GNOME\ HIG.gpl
}

build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
