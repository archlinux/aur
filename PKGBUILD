# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
_pkgname=showmethekey
pkgname="${_pkgname}-git"
pkgver=r35.daee517
pkgrel=1
pkgdesc="A screenkey alternative that works under Wayland via libinput."
arch=("x86_64" "i686" "aarch64" "armv7h" "armv6h")
url="https://showmethekey.alynx.one/"
license=("Apache")
depends=("libevdev" "udev" "libinput" "glib2" "gtk4" "json-glib" "cairo" "pango" "libxkbcommon")
makedepends=("meson" "git")
provides=("showmethekey")
conflicts=("showmethekey")
source=("git+https://github.com/AlynxZhou/showmethekey.git")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  mkdir -p build
}

build() {
  cd "${_pkgname}/build"
  arch-meson . ..
  meson compile
}

package() {
  cd "${_pkgname}/build"
  DESTDIR="${pkgdir}" meson install
  # Meson sets 755 for dirs, but polkit is 750.
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
