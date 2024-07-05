# Maintainer: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

## useful links:
# https://glaxnimate.mattbas.org/
# https://gitlab.com/mattbas/glaxnimate
# https://invent.kde.org/graphics/glaxnimate

# basic info
_pkgname="glaxnimate"
pkgname="$_pkgname"
pkgver=0.5.4
pkgrel=5
pkgdesc="Simple vector animation program"
url="https://glaxnimate.mattbas.org/"
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
sha256sums=('SKIP')

_source_glaxnimate() {
  source+=(
    'kde.breeze-icons'::'git+https://github.com/KDE/breeze-icons.git'
    'mattbas.cmake-lib'::'git+https://gitlab.com/mattbas/CMake-Lib.git'
    'mattbas.python-lottie'::'git+https://gitlab.com/mattbas/python-lottie.git'
    'mattbas.qt-color-widgets'::'git+https://gitlab.com/mattbas/Qt-Color-Widgets.git'
    'mattbas.qt-history-lineedit'::'git+https://gitlab.com/mattbas/Qt-History-LineEdit.git'
    'pybind.pybind11'::'git+https://github.com/pybind/pybind11.git'
    'rpavlik.cmake-modules'::'git+https://github.com/rpavlik/cmake-modules.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )
}
_source_glaxnimate

_prepare_glaxnimate() (
  cd "$_pkgsrc"
  local _submodules=(
    'kde.breeze-icons'::'data/icons/breeze-icons'
    'mattbas.cmake-lib'::'cmake'
    'mattbas.python-lottie'::'data/lib/python-lottie'
    'mattbas.qt-color-widgets'::'external/Qt-Color-Widgets'
    'mattbas.qt-history-lineedit'::'external/Qt-History-LineEdit'
    'pybind.pybind11'::'external/QtAppSetup/external/pybind11'
    'rpavlik.cmake-modules'::'external/cmake-modules'
  )
  _submodule_update
)

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_glaxnimate

  cd "$_pkgsrc"

  # fix for ffmpeg 7.0
  git cherry-pick -n -m1 4fb2b67a0f0ce2fbffb6fe9f87c3bf7914c8a602
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
  cmake --build build --target translations
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
