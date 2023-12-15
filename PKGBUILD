# Maintainer: xiota / aur.chaotic.cx

# options
: ${_autoupdate:=false}
: ${_build_git:=false}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"
[[ "${_autoupdate::1}" == "t" ]] && : ${_pkgver:=$(LANG=C LC_ALL=C pacman -Si extra/dolphin | sed -nE 's@^Version\s+: (.*)-.*$@\1@p' | head -1)}

# basic info
_gitname="dolphin"
_pkgname="$_gitname-tabopts"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=23.08.4
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=(LGPL)
arch=(i686 x86_64)

# main package
_main_package() {
  depends=(
    'baloo-widgets'
    'kio-extras'
  )
  makedepends=(
    'extra-cmake-modules'
  )
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
    'kactivities5'
    'kcmutils5'
    'knewstuff5'
    'kparts5'
    'kuserfeedback5'
  )
  makedepends+=(
    'kdoctools5'
  )
  optdepends+=(
    'purpose5: share context menu'
  )

  _pkgsrc="$_gitname-${_pkgver:?}"
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
    printf '%s' "${_pkgver:?}"
  }
}

# git package
_main_git() {
  depends+=(
    'plasma-activities'
    'kcmutils'
    'knewstuff'
    'kparts'
    'kuserfeedback'
  )
  makedepends+=(
    'git'
    'kdoctools'
  )
  optdepends+=(
    'purpose: share context menu'
  )

  _pkgsrc="$_gitname"
  source+=(
    "$_pkgsrc"::"git+https://invent.kde.org/system/dolphin.git"
    "dolphin-tabopts-2.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/33c2ff50e2611eb04d8a3ad8f30b18aecda42544.patch"
  )
  sha256sums+=(
    'SKIP'
    '43bb309c9815bb7abe6b4a4a4cc9084c4809709c6b037a24cf56bb232b42398f'
  )

  pkgver() {
    cd "$_pkgsrc"

    _regex='^\s+<release version="([0-9]+\.[0-9]+(\.[0-9]+)?)"\s.*/>$'
    _file='src/org.kde.dolphin.appdata.xml'

    _line=$(grep -E "$_regex" "$_file" | head -1)
    _version=$(
      printf '%s\n' "$_line" \
        | sed -E "s@$_regex@\1@"
    )
    _commit=$(
      git log -G "$_line" -1 --pretty=oneline --no-color -- $_file \
        | sed 's@\ .*$@@'
    )
    _revision=$(git rev-list --count $_commit..HEAD)
    _hash=$(git rev-parse --short HEAD)

    printf '%s.r%s.g%s' \
      "$_version" \
      "$_revision" \
      "$_hash"
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
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  cmake -B build -S "$_pkgsrc" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

# execute
_main_package
