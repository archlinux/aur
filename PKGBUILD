# Maintainer: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

_pkgname="glaxnimate"
pkgname="$_pkgname-git"
pkgver=0.5.4.r640.ge878910
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
  'libarchive'
  'potrace'
  'python'
  'qt6-tools'
)
makedepends=(
  'clang' # lupdate/translations
  'cmake'
  'extra-cmake-modules'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="kde.$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    --exclude='*.[0-9][0-9]' \
    --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
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
