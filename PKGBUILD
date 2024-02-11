# Maintainer:

# options
: ${_autoupdate:=false}
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"
[[ "${_autoupdate::1}" == "t" ]] && : ${_pkgver:=$(LANG=C LC_ALL=C pacman -Si extra/dolphin | sed -nE 's@^Version\s+: (.*)-.*$@\1@p' | head -1)}

# basic info
_gitname="dolphin"
_pkgname="$_gitname-tabopts"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=24.01.90.r70.g54eabafc
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=('GPL-2.0-or-later')
arch=(i686 x86_64)

# main package
_main_package() {
  optdepends=(
    'ffmpegthumbs: video thumbnails'
    'kde-cli-tools: for editing file type options'
    'kdegraphics-thumbnailers: PDF and PS thumbnails'
    'kio-admin: for managing files as administrator'
    'konsole: terminal panel'
  )

  provides=("$_gitname=${pkgver%%.r*}")
  conflicts=("$_gitname")

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  : ${_pkgver:=${pkgver%%.r*}}

  depends+=(
    'baloo-widgets'
    'kactivities5'
    'kcmutils5'
    'kio-extras'
    'knewstuff5'
    'kparts5'
    'kuserfeedback5'
  )
  makedepends+=(
    'extra-cmake-modules'
    'kdoctools5'
  )
  optdepends+=(
    'purpose5: share context menu'
  )

  _pkgsrc="$_gitname-$_pkgver"
  _pkgext="tar.xz"
  _dl_url="https://download.kde.org/stable/release-service"
  source+=("$_pkgsrc.$_pkgext"::"$_dl_url/$_pkgver/src/$_pkgsrc.$_pkgext")

  if [[ "${_autoupdate::1}" == "t" ]] ; then
    sha256sums+=('SKIP')
  else
    sha256sums+=('6a630b78018f3344b70131ff2c9deaae5e626295e512ce2741958d5197888585')
  fi

  source+=(
    # "https://invent.kde.org/system/dolphin/-/merge_requests/269.patch"
    "dolphin-tabopts-1.patch"::"https://invent.kde.org/xiota/dolphin/-/merge_requests/1.patch"
  )
  sha256sums+=(
    'a50de534a6049ec4e232b6bddb8b39a105287bd0f6eac934e4eaac50df6f0004'
  )

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  depends+=(
    'baloo-widgets>=24'
    'kactivities'
    'kcmutils'
    'kio-extras>=24'
    'knewstuff'
    'kparts'
    'kuserfeedback'
  )
  makedepends+=(
    'extra-cmake-modules>=5.200'
    'git'
    'kdoctools'
  )
  optdepends+=(
    'purpose: share context menu'
  )

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
  cmake -B build -S "$_pkgsrc" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# execute
_main_package
