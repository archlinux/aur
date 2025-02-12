# Maintainer: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

_pkgname="glaxnimate"
pkgname="$_pkgname-git"
pkgver=0.5.4.r582.gb7a2f57
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

_source_main() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="kde.$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_glaxnimate() {
  source+=(
    'mattbas.cmake-lib'::'git+https://gitlab.com/mattbas/CMake-Lib.git'
    'mattbas.python-lottie'::'git+https://gitlab.com/mattbas/python-lottie.git'
    'mattbas.qt-color-widgets'::'git+https://gitlab.com/mattbas/Qt-Color-Widgets.git'
    'pybind.pybind11'::'git+https://github.com/pybind/pybind11.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_glaxnimate() (
    cd "$_pkgsrc"
    local _submodules=(
      'mattbas.cmake-lib'::'cmake'
      'mattbas.python-lottie'::'data/lib/python-lottie'
      'mattbas.qt-color-widgets'::'external/Qt-Color-Widgets'
      'pybind.pybind11'::'external/QtAppSetup/external/pybind11'
    )
    _submodule_update
  )
}

_source_main
_source_glaxnimate

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _run_if_exists _prepare_glaxnimate
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

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
