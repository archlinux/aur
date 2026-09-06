# Maintainer: Aditya Hebballe <adityahebballe@proton.me>

pkgname=cartridges-rewrite-git
pkgver=49.0.r183.g2531ea2
pkgrel=1
pkgdesc="A GTK4 + Libadwaita game launcher (rewrite branch)"
arch=(any)
url="https://github.com/AdityaHebballe/cartridges"
license=(GPL-3.0-or-later)
depends=(
  dconf
  gdk-pixbuf2
  gobject-introspection-runtime
  gtk4
  hicolor-icon-theme
  libadwaita
  python
  python-gobject
  python-pillow
)
makedepends=(
  blueprint-compiler
  git
  meson
)
checkdepends=(
  appstream
  desktop-file-utils
)
optdepends=(
  "steam: Valve's digital software delivery system"
  'heroic-games-launcher-bin: Native GOG, Epic Games and Amazon Games launcher for Linux'
  'lutris: Open source gaming platform for Linux'
  'bottles: Easily manage wine and proton prefix'
)
provides=(cartridges)
conflicts=(cartridges)
source=("cartridges::git+https://github.com/AdityaHebballe/cartridges.git#branch=rewrite")
b2sums=('SKIP')

pkgver() {
  cd cartridges

  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "49.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  arch-meson cartridges build -D profile=release
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
