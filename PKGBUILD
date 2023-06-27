# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-terminal
pkgname="${_pkgname}-git"
pkgver=3.47.0+142+g25d1133d
pkgrel=1
pkgdesc="The GNOME Terminal Emulator"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=(
  gsettings-desktop-schemas
  vte3 # -git
)
makedepends=(
  docbook-xsl
  git
  gnome-shell
  libnautilus-extension
  meson
  yelp-tools
)
groups=(gnome-extra gnome-extra-git)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgname}"
}

build() {
  local meson_options=(
    -D b_lto=false
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
