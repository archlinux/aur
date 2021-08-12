# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=palette-git
pkgver=2.0.1.r3.gca8e63d
pkgrel=1
pkgdesc="Tool for viewing the GNOME color palette as defined by the design guidelines"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/palette"
license=('GPL3')
depends=('gtk4')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
  "git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
sha256sums=('SKIP'
  'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  git submodule init
  git config submodule.hig.url $srcdir/HIG-app-icons
  git submodule update
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
