# Maintainer:
# Contributor: easymodo <easymodofrf@gmail.com>

: ${_use_sodeps:=false}

_pkgname="qimgv"
pkgname="$_pkgname-git"
pkgver=1.0.2.r170.g34f8b43
pkgrel=2
pkgdesc="Qt image viewer with video playback"
url="https://github.com/easymodo/qimgv"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'exiv2'
  'mpv'
  'opencv'
  'qt6-base'
  'qt6-imageformats'
  'qt6-multimedia'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  sed -E -e 's/Qt5_FOUND/FALSE/' \
    -e '/\bQt5\b/d' \
    -i CMakeLists.txt
}

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
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  if [[ "${_use_sodeps::1}" == "t" ]]; then
    eval "depends+=(
      'libQt6Core.so'
      'libQt6Gui.so'
      'libQt6OpenGLWidgets.so'
      'libQt6PrintSupport.so'
      'libQt6Svg.so'
      'libQt6Widgets.so'
      'libopencv_core.so'
      'libopencv_imgproc.so'
    )"
  fi

  DESTDIR="$pkgdir" cmake --install build
}
