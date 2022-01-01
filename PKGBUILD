# Maintainer: Ícar N. S. <icar.nin@protonmail.com>

_pkgname=fractal
pkgname=fractal-next
pkgver=r370.fbc867e0
pkgrel=2
pkgdesc="GTK4 client for Matrix written in Rust (fractal-next branch)"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/Fractal"
license=(GPL3)
depends=(gtk4 gst-plugins-base-git gst-plugins-ugly-git gst-plugins-bad-git gst-editing-services gtksourceview5 gspell libadwaita)
optdepends=('org.freedesktop.secrets: password storage')
makedepends=(git meson rust cmake)
provides=(fractal)
conflicts=(fractal fractal-git)
source=("fractal::git+https://gitlab.gnome.org/GNOME/fractal#branch=fractal-next")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
    cd "$srcdir/fractal"
# Let's fix this while we wait upstream to fix it
    sed -i "s/'libadwaita-1', version: '>= 1.0.0-alpha.1'/'libadwaita-1', version: '>= 1.0.0'/g" meson.build
}

build() {
    cd "${_pkgname}"
    arch-meson . _build
    meson compile -C _build
}

package() {
    cd ${_pkgname}
    DESTDIR="${pkgdir}" meson install -C _build
}
