# Maintainer:
# Contributor: Maarten Baert <maarten-baert@hotmail.com>

_pkgname="simplescreenrecorder"
pkgname="$_pkgname-git"
pkgver=0.4.4.r76.gd790385
pkgrel=1
pkgdesc="A feature-rich screen recorder that supports X11 and OpenGL"
url="https://github.com/MaartenBaert/ssr"
license=("GPL-3.0-or-later")
arch=("x86_64")

depends=(
  'alsa-lib'
  'ffmpeg'
  'glu'
  'jack'
  'libgl'
  'libpipewire'
  'libpulse'
  'libx11'
  'libxext'
  'libxfixes'
  'libxi'
  'libxinerama'
  'qt6-base'
  'v4l-utils'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
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
    -DWITH_QT6=ON
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
