# Maintainer:
# Contributor: Jonathon Fernyhough <jonathon_at+manjaro dot+org>

_pkgname="birdtray"
pkgname="$_pkgname-git"
pkgver=1.11.4.r67.g7e35be6
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon"
url="https://github.com/gyunaev/birdtray"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64' 'aarch64')

depends=(
  'hicolor-icon-theme'
  'qt6-base'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-declarative'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
