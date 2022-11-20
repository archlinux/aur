# Based on the file created for Arch Linux by:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>
# Contributor: Andrey Vetrov <vetrov at mail dot ru>
# Maintainer: Pellegrino Prevete <pellegrinoprevete at gmail dot com>
#
# Removed webkit2gtk dependency:
# https://github.com/QubesOS/qubes-issues/issues/3279
# https://bugs.archlinux.org/task/50548

# shellcheck disable=SC2034
_pkgname="zenity"
_variant="gtk4"
pkgname="${_pkgname}-${_variant}-git"
pkgver=3.32.0.r105.g55f7e47e
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
_branch="${_variant}-port"
arch=(x86_64)
license=(LGPL)
provides=("${_pkgname}" "${_pkgname}-${_variant}")
conflicts=("${_pkgname}" "${_pkgname}-${_variant}")
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
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

# shellcheck disable=SC2154
package() {
  meson install -C build --destdir "${pkgdir}"
}
