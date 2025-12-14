# Maintainer:
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail dot com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

## links
# https://www.siril.org/
# https://gitlab.com/free-astro/siril

_pkgname="siril"
pkgname="$_pkgname-git"
pkgver=1.4.0.r83.gf3f0431
pkgrel=1
pkgdesc="Astronomical image processing software for Linux (IRIS clone)"
url="https://gitlab.com/free-astro/siril"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')

depends=(
  'cfitsio'
  'curl'
  'exiv2'
  'ffms2'
  'fftw'
  'gsl'
  'gtk3'
  'gtksourceview4'
  'kplotting'
  'libgit2'
  'libheif'
  'libraw'
  'libxisf'
  'opencv'
  'wcslib'
)
makedepends=(
  'cmake'
  'git'
  'meson'
  'ninja'
)
checkdepends=(
  'criterion'
)

options=('!lto')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1

  # https://github.com/mesonbuild/meson/pull/15297
  sed -e '/LIBRARY_VERSION/d' -i subprojects/librtprocess/CMakeLists.txt
  sed -E -e '/set_target_properties\(htmesh/d' \
    -e '/^ *VERSION [0-9\.]+/d' \
    -e '/^ *SOVERSION [0-9]+/d' \
    -i subprojects/htmesh/CMakeLists.txt
  sed -e '/YYJSON_SOVERSION/d' -i subprojects/yyjson/CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  local _tag _version _revision _hash
  _tag=$(git tag | grep -Ev '(1\.3\.3|[a-z][a-z])' | sort -rV | head -1)
  _version=${_tag:?}
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _meson_options=()
  if ((CHECKFUNC)); then
    _meson_options+=(-Dcriterion=true)
  fi

  arch-meson "${_meson_options[@]}" "$_pkgsrc" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "$pkgdir/usr/lib"
}
