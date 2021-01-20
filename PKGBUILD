# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=libadwaita
pkgname=libadwaita-git
pkgver=1.1.0.r.g9d8f4ab
pkgrel=1
pkgdesc="Library full of GTK+ widgets for mobile phones"
url="https://gitlab.gnome.org/exalm/libadwaita"
license=(LGPL)
arch=(i686 x86_64 armv7h aarch64)
depends=(gtk3)
makedepends=(git glade gobject-introspection meson vala)
checkdepends=(xorg-server-xvfb)
source=("git+$url")
provides=(libadwaita)
conflicts=(libadwaita)
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
    rm -rf $pkgdir/usr/share/locale/*/LC_MESSAGES/libhandy.mo
}
