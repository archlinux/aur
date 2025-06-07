# Maintainer: xiota / aur.chaotic.cx

# options
: ${_pkgtype:=-tabopts}

: ${_commit_patch:=7cce4b12e43b046104bbfc9a6da481e97f4f2f3c}

_pkgname="dolphin"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=25.04.2
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/xiota/dolphin/-/merge_requests/1"
license=('GPL-2.0-or-later')
arch=('x86_64' 'i686')

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
  'ninja'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kdenetwork-filesharing: samba usershare properties menu'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
  'purpose: share context menu'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_dl_url="https://invent.kde.org/system/dolphin.git#tag=v$pkgver"
_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$_dl_url"
  "dolphin-tabopts-${_commit_patch::7}.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/${_commit_patch}.patch"
)
sha256sums=(
  '5aa5df1f3136f23ced6ca5a9f3eec6eab257f3f3d45c04544da6b69cc5a6651b'
  'a299037d34c16d8e078e1f751ab6a921bae64f4804755864a5416da2f62db121'
)

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
    -G Ninja
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
