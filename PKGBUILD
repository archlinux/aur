# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=palette-git
pkgver=2.0.2.r3.g3a145d1
pkgrel=1
pkgdesc="Tool for viewing the GNOME color palette as defined by the design guidelines"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/design/palette"
license=('GPL3')
depends=('libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+$url.git"
  "git+https://gitlab.gnome.org/Teams/Design/HIG-app-icons.git")
b2sums=(
  'SKIP'
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
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
