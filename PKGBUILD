# Maintainer: Aditya Hebballe <adityahebballe@proton.me>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=cartridges-fast-git
pkgver=r1416.gcb0d7d0
pkgrel=1
pkgdesc="A GTK4 + Libadwaita game launcher"
arch=(any)
url="https://github.com/AdityaHebballe/cartridges"
license=(GPL3)
depends=(gtk4 libadwaita gdk-pixbuf2 gobject-introspection-runtime python python-gobject python-requests python-yaml
         python-pillow python-urllib3 dconf hicolor-icon-theme)
makedepends=(git blueprint-compiler meson)
checkdepends=(appstream-glib)
optdepends=("steam: Valve's digital software delivery system"
            'heroic-games-launcher: Native GOG and Epic Games launcher for Linux'
            'bottles: Easily manage wine and proton prefix')
provides=(cartridges)
conflicts=(cartridges)
source=("git+https://github.com/AdityaHebballe/cartridges.git")
b2sums=('SKIP')

pkgver() {
  cd cartridges

  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  arch-meson cartridges build -D tiff_compression=jpeg
  meson compile -C build
}

check() {
  # https://github.com/kra-mo/cartridges/issues/206
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
