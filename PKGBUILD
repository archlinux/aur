# Maintainer:
# Contributor: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Lubosz Sarnecki <lubosz at gmail dot com>
# Contributor: Vincent Hourdin <vh|at|free-astro=DOT=vinvin.tf>

## useful urls:
# https://www.siril.org/
# https://gitlab.com/free-astro/siril

## options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ] ; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_avx:=false}
: ${_build_git:=true}

[[ "${_build_avx::1}" == "t" ]] && _pkgtype+="-avx"
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

# basic info
_pkgname="siril"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.2.1.r708.gc6150305
pkgrel=1
pkgdesc="Astronomical image processing software for Linux (IRIS clone)"
url="https://gitlab.com/free-astro/siril"
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')

# main package
_main_package() {
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

    ## implicit
    #'cairo'
    #'ffmpeg'
    #'gcc-libs'
    #'gdk-pixbuf2'
    #'glib2'
    #'glibc'
    #'hicolor-icon-theme'
    #'json-glib'
    #'lcms2'
    #'libjpeg-turbo'
    #'libpng'
    #'libtiff'
    #'pango'
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

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _update_version

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=$_pkgver")
  sha256sums+=('SKIP')

  _source_siril

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  _source_siril

  pkgver() {
    cd "$_pkgsrc"
    local _version=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
    local _revision=$(git rev-list --count --cherry-pick $_version...HEAD)
    local _hash=$(git rev-parse --short=8 HEAD)
    printf "%s.r%s.g%s" "${_version:?}" "${_revision:?}" "${_hash:?}"
  }
}

# submodules
_source_siril() {
  source+=(
    'flathub.shared-modules'::'git+https://github.com/flathub/shared-modules.git'
    'carvac.librtprocess'::'git+https://github.com/CarVac/librtprocess.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
  )

  _prepare_siril() (
    cd "$_pkgsrc"
    local -A _submodules=(
      ['flathub.shared-modules']='build/flatpak/shared-modules'
      ['carvac.librtprocess']='subprojects/librtprocess'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_siril
}

build() {
  local _meson_options=(
    "$_pkgsrc"
    build
  )

  # criterion available and needed only for check
  if pacman -Q criterion 2> /dev/null ; then
    _meson_options+=(
      -Dcriterion=true
    )
  fi

  if [[ "${_build_avx::1}" == "t" ]] ; then
    export CFLAGS="$(echo "$CFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
    export CXXFLAGS="$(echo "$CXXFLAGS" | sed -E 's@(\s*-(march|mtune)=\S+\s*)@ @g;s@\s*-O[0-9]\s*@ @g;s@\s+@ @g') -march=x86-64-v3 -mtune=generic -O3"
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

# update version
_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]] ; then
    return
  fi

  local _response=$(curl -Ssf "$url/-/tags?format=atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '"https://.*/tags/.*"' \
      | sed -E 's@^.*/tags/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )
  local _pkgver_new="${_tag:?}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ] ; then
    _pkgver="${_pkgver_new:?}"
  fi
}

# execute
_main_package
