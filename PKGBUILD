# Maintainer: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

_pkgname="glaxnimate"
pkgname="$_pkgname"
pkgver=0.6.0
pkgrel=1
pkgdesc="Simple vector animation program"
url="https://invent.kde.org/graphics/glaxnimate"
license=('GPL-3.0-or-later')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')

depends=(
  'ffmpeg'
  'karchive'
  'kcompletion'
  'kcoreaddons'
  'kcrash'
  'ki18n'
  'kwidgetsaddons'
  'kxmlgui'
  'potrace'
  'python'
  'qt6-tools'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

_pkgsrc="kde.$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('c630047572502237a3633d64d63e5b88869b8d7aeb3bf0732a8e376da15d3013')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DQT_MAJOR_VERSION=6
    -DVERSION_SUFFIX=""
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
