# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=libadwaita
pkgname=$_pkgname-git
pkgver=1.1.0.r.g699c5ea
pkgrel=2
pkgdesc="Library full of GTK+ widgets for mobile phones"
url="https://gitlab.gnome.org/exalm/$_pkgname"
license=(LGPL)
arch=(i686 x86_64 armv7h aarch64)
depends=(gtk4)
makedepends=(git gobject-introspection meson vala wayland-protocols)
checkdepends=(xorg-server-xvfb)
source=("git+$url")
provides=($_pkgname)
conflicts=($_pkgname)
md5sums=(SKIP)

  pkgver() {
    cd $_pkgname
  
    printf "%s.r%s.g%s" "$(grep -m1 'version' meson.build | sed -r 's/([^0-9]*([0-9.]+)).*/\2/')" \
                        "$(git describe --tags --long | cut -d '-' -f 2)" \
                        "$(git rev-parse --short HEAD)"
  }

build() {
    arch-meson $_pkgname build -Dgtk_doc=false -Dexamples=true
    DESTDIR="$pkgdir" ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
