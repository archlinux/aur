# Maintainer:

_pkgname="phonon-qt6-mpv"
pkgname="$_pkgname-git"
pkgdesc="Phonon MPV backend for Qt6"
pkgver=0.1.0.r0.g069aca4
pkgrel=2
url="https://github.com/OpenProgger/phonon-mpv"
license=('LGPL-2.1-only')
arch=('x86_64')

depends=(
  'glibc'
  'mpv'
  'phonon-qt6'
)
makedepends=(
  'extra-cmake-modules'
  'git'
  'ninja'
)

provides=(
  "$_pkgname"
  'phonon-qt6-backend'
)
conflicts=("$_pkgname")

_pkgsrc="phonon-mpv"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DPHONON_BUILD_QT5=OFF
    -DPHONON_BUILD_QT6=ON
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
