# Maintainer: Pellegrino Prevet (tallero) 

_pkg="gnome-shell"
_pkgname="${_pkg}-extensions"
pkgname="${_pkgname}-git"
pkgver=44.0+7+gb7895ad
pkgrel=1
pkgdesc="Extensions for GNOME shell, including classic mode"
url="https://wiki.gnome.org/Projects/GnomeShell/Extensions"
arch=(any)
license=(GPL)
depends=(
  "${_pkg}"
)
makedepends=(
  git
  meson
  git
  sassc
)
optdepends=(
  'gnome-menus: applications menu extension'
)
groups=(gnome)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}"
        "git+https://gitlab.gnome.org/GNOME/${_pkg}-sass.git")
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${_pkgname}"

  git submodule init
  git config --local "submodule.data/${_pkg}-sass.url" \
      "${srcdir}/${_pkg}-sass"
  git submodule update
}

build() {
  local meson_options=(
    -D extension_set=all
    -D classic_mode=true
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
