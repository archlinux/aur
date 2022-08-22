# Maintainer: Your Name <youremail@domain.com>

pkgname=gelata-git
pkgver=r2.e72a7b3
pkgrel=1
pkgdesc="Gelata is a modern and robust Jellyfin client for the Linux desktop."
arch=('any')
url="https://gitlab.com/bscubed/gelata"
license=('GPL3')
depends=('libadwaita' 'mpv' 'python-gobject' 'python-opengl' 'python-pycountry')
makedepends=('git' 'meson' 'blueprint-compiler' 'gobject-introspection')
checkdepends=('appstream-glib')
optdepends=('jellyfin: The Free Software Media System')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
