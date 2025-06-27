# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Sébastien Luttringer <sеblu@аrchlіnux․org>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=lib32-wayland-git
pkgver=1.23.92.r4.g9018703
pkgrel=1
pkgdesc='A computer display server protocol (32-bit, development version)'
arch=(x86_64)
url=https://wayland.freedesktop.org
license=(MIT)
depends=(
  lib32-glibc
  lib32-libffi
  lib32-expat
  lib32-libxml2
  wayland
)
makedepends=(git meson)
conflicts=('lib32-wayland')
provides=("lib32-wayland=${pkgver}" libwayland-{client,cursor,egl,server}.so)
source=("git+https://gitlab.freedesktop.org/wayland/wayland.git")
b2sums=('SKIP')

pkgver() {
  cd wayland
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  arch-meson build wayland \
    --libdir=/usr/lib32 \
    -Ddocumentation=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s wayland "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
