# Maintainer: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

_pkgname="glaxnimate"
pkgname="$_pkgname"
pkgver=0.5.4
pkgrel=7
pkgdesc="Simple vector animation program"
url="https://invent.kde.org/graphics/glaxnimate"
license=('GPL-3.0-or-later')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')

depends=(
  'ffmpeg'
  'libarchive'
  'potrace'
  'python'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-tools'
)
makedepends=(
  'clang' # lupdate/translations
  'cmake'
  'git'
  'ninja'
  'qt6-declarative'
)

_pkgsrc="kde.$_pkgname"
source=("$_pkgsrc"::"git+https://invent.kde.org/graphics/glaxnimate.git#tag=$pkgver")
sha256sums=('f17f3cce6978932b88c80c9a0db3ee86992bc193014c315af12df825fa5ef2cb')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1

  # fix for ffmpeg 7.0
  git cherry-pick -n -m1 4fb2b67a0f0ce2fbffb6fe9f87c3bf7914c8a602

  # force Qt6
  sed -E -e 's@Qt5 Qt6@Qt6@' \
    -i CMakeLists.txt \
    external/Qt-History-LineEdit/CMakeLists.txt
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DQT_VERSION_MAJOR=6
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
  cmake --build build --target translations
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
