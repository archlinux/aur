# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=workbench-git
_pkgname=Workbench
pkgver=r115.aaf9446
pkgrel=1
pkgdesc="Learn and prototype with GNOME technologies"
arch=('x86_64')
url="https://github.com/sonnyp/Workbench"
license=('GPL3')
depends=('libadwaita' 'glib2' 'gtksourceview5' 'gjs' 'vte4-git' 'libportal-gtk4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
   cd "${_pkgname%-git}"
   git submodule init
   git submodule update
   sed -i 's/\/app\//\/usr\//' src/re.sonny.Workbench
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
