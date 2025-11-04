# Maintainer:
# Contributor: Leo Verto <leotheverto+aur@gmail.com>

_pkgname="qlcplus"
pkgname="$_pkgname-git"
pkgver=5.0.0.r96.g0dda4e7
pkgrel=1
pkgdesc="Q Light Controller Plus to control professional DMX lighting fixtures"
url="https://github.com/mcallegari/qlcplus"
license=('Apache-2.0')
arch=('x86_64' 'i686' 'armv7h')

depends=(
  'fftw'
  'libftdi'
  'libmad'
  'libsndfile'
  'qt6-multimedia'
  'qt6-serialport'
  'qt6-svg'
  'qt6-websockets'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt6-tools'
)
optdepends=(
  'ola: Open Lighting Architecture plugin'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"

  # unset unnecessary warnings and errors
  sed -E -e 's&^.*set\(.*-W.*$&&' -i variables.cmake

  # force Qt6
  sed -e 's&Qt5 Qt6&Qt6&' CMakeLists.txt
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[Rab]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # for lrelease
  export PATH="/usr/lib/qt6/bin:$PATH"

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
  DESTDIR="$pkgdir" cmake --install build
}
