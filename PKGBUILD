# Maintainer: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

## useful links:
# https://gitlab.com/mattbas/glaxnimate
# https://glaxnimate.mattbas.org/

# basic info
_pkgname="glaxnimate"
pkgname="$_pkgname"
pkgver=0.5.4
pkgrel=4
pkgdesc="Simple vector animation program"
url="https://glaxnimate.mattbas.org/"
license=('GPL-3.0-or-latr')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')

# main package
_main_package() {
  depends=(
    'ffmpeg'
    'libarchive'
    'potrace'
    'python'
    'qt6-base'
    'qt6-imageformats'
    'qt6-svg'
    'qt6-tools'
    'zlib'
  )
  makedepends=(
    'clang' # lupdate/translations
    'cmake'
    'git'
    'ninja'
    'qt6-declarative'
  )

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+https://gitlab.com/mattbas/glaxnimate.git#tag=$pkgver")
  sha256sums=('SKIP')

  _source_glaxnimate
}

# submodules
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
}

# common functions
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
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
  cmake --build build --target translations
}

package() {
  depends+=(
    'hicolor-icon-theme'
  )

  DESTDIR="$pkgdir" cmake --install build
}

# execute
_main_package
