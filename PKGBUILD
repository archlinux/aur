# Maintainer:
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail dot com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

_pkgname="siril"
pkgname="$_pkgname-git"
pkgver=1.4.4.r721.g09af626
pkgrel=2
pkgdesc="Astronomical image processing software for Linux (IRIS clone)"
url="https://gitlab.com/free-astro/siril"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')

depends=(
  'cfitsio'
  'curl'
  'exiv2'
  'ffmpeg'
  'ffms2'
  'fftw'
  'gsl'
  'gtk4'
  'gtksourceview5'
  'libgit2'
  'libheif'
  'libraw'
  'libxisf'
  'opencv'
  'python'
  'python-numpy'
  'python-onnxruntime'
  'python-packaging'
  'python-platformdirs'
  'python-requests'
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
  sed -e "/test('qhy_gps_test/d" -i "$_pkgsrc/src/tests/meson.build"

  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
