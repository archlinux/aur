# Maintainer: Ícar N. S. <icar.nin@protonmail.com>

_pkgname=fractal
pkgname=fractal-next
pkgver=5.alpha.r550.eb9123ed
pkgrel=1
pkgdesc="GTK4 client for Matrix written in Rust (5.alpha version)"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/Fractal"
license=(GPL3)
depends=(gtk4 gst-plugins-base gst-plugins-ugly gst-plugins-bad gst-editing-services gtksourceview5 gspell libadwaita pipewire)
optdepends=('org.freedesktop.secrets: password storage')
makedepends=(git meson rust cmake clang)
provides=(fractal)
conflicts=(fractal fractal-git)
source=("fractal::git+https://gitlab.gnome.org/GNOME/fractal#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "5.alpha.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
