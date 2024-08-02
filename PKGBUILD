# Maintainer:
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail dot com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

## links
# https://www.siril.org/
# https://gitlab.com/free-astro/siril

# basic info
_pkgname="siril"
pkgname="$_pkgname-git"
pkgver=1.2.3.r1131.g49a0646
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
  'criterion' # AUR
)

_source_main() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_siril() {
  source+=(
    'flathub.shared-modules'::'git+https://github.com/flathub/shared-modules.git'
    'carvac.librtprocess'::'git+https://github.com/CarVac/librtprocess.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

}

_prepare_siril() (
  cd "$_pkgsrc"
  local _submodules=(
    'flathub.shared-modules'::'build/flatpak/shared-modules'
    'carvac.librtprocess'::'subprojects/librtprocess'
  )
  _submodule_update
)

_source_main
_source_siril

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_siril
}

pkgver() {
  cd "$_pkgsrc"
  local _version=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
  local _revision=$(git rev-list --count --cherry-pick $_version...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  printf "%s.r%s.g%s" "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  local _meson_options=(
    "$_pkgsrc"
    build
  )

  # criterion available and needed only for check
  if pacman -Q criterion 2> /dev/null; then
    _meson_options+=(
      -Dcriterion=true
    )
  fi

  arch-meson "${_meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
