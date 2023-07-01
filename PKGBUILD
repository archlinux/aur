# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkg="peas"
_pkgname="lib${_pkg}"
pkgbase="${_pkgname}-git"
pkgname=(
  "${_pkgname}2-git"
  "${_pkgname}2-docs-git"
)
pkgver=1.99.0+1+g338cf0e
pkgrel=1
pkgdesc="A GObject plugins library"
url="https://wiki.gnome.org/Projects/Lib${_pkg}"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
license=(LGPL)
depends=(
  gobject-introspection-runtime
  gtk3
)
makedepends=(
  gi-docgen
  git
  glade
  gobject-introspection
  lua51-lgi
  meson
  python-gobject
  vala
)
checkdepends=(xorg-server-xvfb)
optdepends=(
  'python-gobject: Python loader')
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed "s/^${_pkgname}-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D vapi=true
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package_libpeas2-git() {
  provides=(
    "${_pkgname}2=${pkgver}"
    "${_pkgname}2"{,-gtk}"-1.0.so")
  conflicts=("${_pkgname}2")

  meson install -C build --destdir "${pkgdir}"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libpeas2-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(
    "${_pkgname}2-docs=${pkgver}")
  conflicts=("${_pkgname}2-docs")

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
