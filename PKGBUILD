# Maintainer: xiota / aur.chaotic.cx

# options
: ${_autoupdate:=false}
: ${_build_git:=false}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"
[[ "${_autoupdate::1}" == "t" ]] && : ${_pkgver:=$(LANG=C LC_ALL=C pacman -Si extra/dolphin | sed -nE 's@^Version\s+: (.*)-.*$@\1@p' | head -1)}

# basic info
_gitname="dolphin"
_pkgname="$_gitname-tabopts"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=24.02.0
pkgrel=2
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=('GPL-2.0-or-later')
arch=(i686 x86_64)

# main package
_main_package() {
  depends+=(
    'baloo-widgets'
    'kcmutils'
    'kio-extras'
    'knewstuff'
    'kparts'
    'kuserfeedback'
    'plasma-activities'
  )
  makedepends+=(
    'extra-cmake-modules>=5.200'
    'git'
    'kdoctools'
  )
  optdepends=(
    'ffmpegthumbs: video thumbnails'
    'kde-cli-tools: for editing file type options'
    'kdegraphics-thumbnailers: PDF and PS thumbnails'
    'kio-admin: for managing files as administrator'
    'konsole: terminal panel'
    'purpose: share context menu'
  )

  provides=("$_gitname=${pkgver%%.r*}")
  conflicts=("$_gitname")

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable

    source+=('https://invent.kde.org/system/dolphin/-/commit/95551f44.patch')
    sha256sums+=('6e56ba2c4e5379742fe2fb839b10a2d01f43101634e063966ac2e0f5fd134e9e')
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  : ${_pkgver:=${pkgver%%.r*}}

  _pkgsrc="$_gitname-$_pkgver"
  _pkgext="tar.xz"
  _dl_url="https://download.kde.org/stable/release-service"
  source+=("$_pkgsrc.$_pkgext"::"$_dl_url/$_pkgver/src/$_pkgsrc.$_pkgext")

  if [[ "${_autoupdate::1}" == "t" ]] ; then
    sha256sums+=('SKIP')
  else
    sha256sums+=('10ef284597e28f933d8b4ead75d02759a15df4bcc928ed10b54f8065b7431257')
  fi

  source+=(
    # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
    "dolphin-tabopts-3.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/62b60d15f2680e46d143611d55dc7f9f74aed50f.patch"
  )
  sha256sums+=(
    '390fbd2fe4cbd34001004ccca80b9677709d1d0f8f6a10b2b80659dc2dea6874'
  )

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  _pkgsrc="$_gitname"
  source+=(
    "$_pkgsrc"::"git+https://invent.kde.org/system/dolphin.git"
    "dolphin-tabopts-3.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/62b60d15f2680e46d143611d55dc7f9f74aed50f.patch"
  )
  sha256sums+=(
    'SKIP'
    '390fbd2fe4cbd34001004ccca80b9677709d1d0f8f6a10b2b80659dc2dea6874'
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  }
}

# common functions
prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]] ; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "$srcdir/$src"
    fi
  done
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# execute
_main_package
