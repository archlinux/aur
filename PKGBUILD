# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Mark Wagie (yochananmarqos) <mark.wagie@proton.me>
# Contributor: Fabio Loli (fabiololix) <fabio.loli@disroot.org>

_pkg="gedit"
_pkgname="lib${_pkg}-gtksourceview"
pkgname="${_pkgname}-git"
pkgver=299.0.3+5+gffb59486
pkgrel=1
_pkgdesc=("A library that extends GtkTextView, the standard GTK "
          "widget for multiline text editing.")
pkgdesc="${_pkgdesc[@]}"
arch=(x86_64)
url="https://${_pkg}-technology.net"
license=(LGPL2.1)
depends=(
  'gtk3'
  'libxml2'
)
makedepends=(
  'git'
  'gobject-introspection'
  'gtk-doc'
  'meson'
)
checkdepends=(
  'xorg-server-xvfb'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-300.so"
)
conflicts=(
  "${_pkgname}"
)
_repo_url="https://github.com/${_pkg}-technology/${_pkgname}"
source=(
  "${_pkgname}::git+${_repo_url}"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  export NO_AT_BRIDGE=1
  xvfb-run -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
