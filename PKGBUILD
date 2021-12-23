# Maintainer: Triss Healy (trissylegs) <th at trissyle dot gs>

_pkgname=libshumate
pkgname=${_pkgname}-git
pkgver=r270.5c08c3a
pkgrel=1
pkgdesc="GTK4 widget to display maps (git version)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/libshumate"
license=(LGPL)
depends=(gtk4 libsoup sqlite protobuf-c)
makedepends=(git gobject-introspection gtk-doc gi-docgen meson vala)
checkdepends=(xorg-server-xvfb)
provides=(libshumate)

source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha256sums=('SKIP')

# Use version once repo has been tagged. But use revision numbers for now.
pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson ${_pkgname} build -D gtk_doc=true
  ninja -C build
}

check() {
    # Run tests with headless x11 server.
    xvfb-run meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
