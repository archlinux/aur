# Maintainer: Triss Healy (trissylegs) <th at trissyle dot gs>

pkgname=libshumate-git
pkgrel=1
pkgdesc="GTK4 widget to display maps (git version)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/libshumate"
license=(LGPL)
depends=(gtk4 libsoup sqlite)
makedepends=(git gobject-introspection gtk-doc gi-docgen meson vala)
provides=("libshumate")

source=("git+https://gitlab.gnome.org/GNOME/${pkgname/-git/}.git")
sha256sums=('SKIP')

# Use version once repo has been tagged. But use revision numbers for now.
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${pkgname/-git/}
}

build() {
  arch-meson ${pkgname/-git/} build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
