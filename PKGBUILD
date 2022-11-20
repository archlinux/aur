# Based on the file created for Arch Linux by:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>
# Contributor: Andrey Vetrov <vetrov at mail dot ru>
# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
#
# Removed webkit2gtk dependency:
# https://github.com/QubesOS/qubes-issues/issues/3279
# https://bugs.archlinux.org/task/50548

_pkgname="zenity"
_variant="gtk4"
pkgname="${_pkgname}-${_variant}-git"
pkgver=3.32.0.r105.g55f7e47e
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts"
url="https://gitlab.gnome.org/GNOME/zenity"
_branch="${_variant}-port"
arch=(x86_64)
license=(LGPL)
provides=("${_pkgname}-${_variant}")
conflicts=("${_pkgname}-${_variant}")
replaces=('zenity')
depends=('libnotify')
makedepends=(meson yelp-tools)
source=("${_pkgname}::git+${url}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --long --tags | sed 's/^ZENITY_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}" || exit
#  NOCONFIGURE=1 ./autogen.sh
}

build() {
  arch-meson zenity build
  meson compile -C build
}
#  cd ${pkgname%-*}
#  ./configure \
#      --prefix=/usr \
#      --sysconfdir=/etc \
#      --disable-webkitgtk \
#      --localstatedir=/var
#  make
#}

check() {
  meson test -C build --print-errorlogs
}

package() {
#  cd ${pkgname%-*}
#  make DESTDIR="${pkgdir}" install
  meson install -C build --destdir "$pkgdir"
}
