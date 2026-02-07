# Maintainer:

_pkgname="dolphin"
pkgname="$_pkgname-tabopts"
pkgver=25.12.2
pkgrel=1
pkgdesc='KDE File Manager - with extended tab options'
url="https://invent.kde.org/system/dolphin/-/merge_requests/1152"
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
  "dolphin-MR1152-tab_options.patch"::"https://invent.kde.org/system/dolphin/-/commit/a31695655194c57c608f938c94684fe8db93696b.patch"
)
sha256sums=(
  '5489cce485cf12179b2d0e2d49b4a819f1c4a08182409ff1386b3bf1df7075c6'
  'bf81aa3ed12a3cdad45ec96f136d629ab0b6a2b20c54239a89ebdd418813e4ae'
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
