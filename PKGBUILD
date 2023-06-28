# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=devhelp
pkgbase="${_pkgname}-git"
pkgname=(
  "${pkgbase}"
  "${_pkgname}-docs-git"
)
pkgver=43.0+9+g4d15da51
pkgrel=1
pkgdesc="API documentation browser for GNOME"
url="https://wiki.gnome.org/Apps/Devhelp"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
license=(GPL)
depends=(
  webkit2gtk-4.1
)
makedepends=(
  appstream-glib
  git
  gi-docgen
  gobject-introspection
  meson
  yelp-tools
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgname}"
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D plugin_emacs=true
    -D plugin_gedit=true
    -D plugin_vim=true
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_devhelp-git() {
  groups=(
    gnome-extra
    gnome-extra-git
  )
  meson install -C build --destdir "${pkgdir}"

  # Split -docs
  mkdir -p docs/usr/share
  mv -t docs/usr/share "$pkgdir"/usr/share/doc
}

package_devhelp-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()

  mv -t "$pkgdir" docs/*
}

# vim:set sw=2 sts=-1 et:
