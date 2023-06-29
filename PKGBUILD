# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgbase="d-spy"
pkgbase="${_pkgbase}-git"
pkgname=(
  "${pkgbase}"
  'libdspy-git'
)
pkgver=1.6.0.r4.g3d393d9
pkgrel=1
pkgdesc='A D-Bus explorer for GNOME'
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/${_pkgbase}"
license=('GPL3')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  ( set -o pipefail
    git describe --long 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" \
                      "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgbase}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_d-spy-git() {
  depends=(
    'libadwaita'
    'libdspy'
  )
  provides=(
    "${_pkgbase}=${pkgver}")
  conflicts=(
    "${_pkgbase}")
  
  meson install -C build --destdir "${pkgdir}"
  cd "${pkgdir}"
  _pick library usr/include usr/lib
}

package_libdspy-git() {
  pkgdesc='D-Spy library for IDE integration'
  license=(
    'LGPL3')
  depends=(
    'glib2')
  provides=(
    "libdspy=${pkgver}")
  conflicts=(
    "libdspy")
  
  mv library/* "${pkgdir}"
}
