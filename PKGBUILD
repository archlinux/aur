# Maintainer: xiota / aur.chaotic.cx

: ${_commit_patch:=7cce4b12e43b046104bbfc9a6da481e97f4f2f3c}

_pkgname="dolphin"
pkgname="$_pkgname-tabopts"
pkgver=25.12.0
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
  'ktextwidgets'
  'kuserfeedback'
  'kwidgetsaddons'
  'qt6-multimedia'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'kdoctools'
  'ninja'
)
optdepends=(
  'ffmpegthumbs: video thumbnails'
  'filelight: detailed disk usage statistics'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kdenetwork-filesharing: samba usershare properties menu'
  'kdf: view disk usage'
  'kio-admin: for managing files as administrator'
  'kompare: comparing files menu action'
  'konsole: terminal panel'
  'purpose: share context menu'
)

provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://invent.kde.org/system/dolphin.git#tag=v$pkgver"
  "dolphin-tabopts-${_commit_patch::7}.patch"::"https://invent.kde.org/xiota/dolphin/-/commit/${_commit_patch}.patch"
)
sha256sums=(
  '083b9868d644bc2bbb4fc1a71f0872ce4fa7a1467acf2c293024f9a0b9a77a19'
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
