# Maintainer: Adrià Arrufat (swiftscythe) <swiftscythe@gmail.com>
# Contributor: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-terminal
pkgname="${_pkgname}-git"
pkgver=3.97.0+r27+g63cc638d
pkgrel=1
pkgdesc="The GNOME Terminal Emulator"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=(
  dconf
  glib2
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  libadwaita
  libx11
  pango
  vte4
)
makedepends=(
  docbook-xsl
  git
  gnome-shell
  libnautilus-extension
  meson
  python-packaging
  yelp-tools
)
optdepends=(
  "libnautilus-extension: Nautilus integration"
)
provides=("gnome-terminal")
conflicts=("gnome-terminal")

groups=(gnome-extra gnome-extra-git)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
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
