# Maintainer: xiota / aur.chaotic.cx

# options
: ${_autoupdate:=false}

: ${_pkgtype:=-tabopts}

: ${_commit:=0fe6544079a23769e8f19ee2f09b5c149f404d5a} # 24.12.0.1
: ${_commit_patch:=7cce4b12e43b046104bbfc9a6da481e97f4f2f3c}

# basic info
_pkgname="dolphin"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=24.12.0.1
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=('GPL-2.0-or-later')
arch=(i686 x86_64)

depends=(
  'baloo-widgets'
  'kcmutils'
  'kio-extras'
  'knewstuff'
  'kparts'
  'kuserfeedback'
  'plasma-activities'
)
makedepends=(
  'extra-cmake-modules'
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

if [[ "${_autoupdate::1}" == "t" ]]; then
  : ${_pkgver:=$(LANG=C LC_ALL=C pacman -Si extra/dolphin | sed -nE 's@^Version\s+: (.*)-.*$@\1@p' | head -1)}
  _dl_url="https://invent.kde.org/system/dolphin.git#tag=v$_pkgver"
else
  : ${_pkgver:=${pkgver%%.r*}}
  _dl_url="https://invent.kde.org/system/dolphin.git#commit=$_commit"
fi

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$_dl_url"
  "dolphin-tabopts-${_commit_patch::7}.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/${_commit_patch}.patch"
)
sha256sums=(
  'SKIP'
  'a299037d34c16d8e078e1f751ab6a921bae64f4804755864a5416da2f62db121'
)

pkgver() {
  echo "${_pkgver:?}"
}

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
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
