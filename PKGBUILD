# Maintainer: Xiota
# Contributor: Mattia Basaglia <glax@dragon.best>
# Contributor: Sythelux Rikd <dersyth@gmail.com>

_pkgname="glaxnimate"
pkgname="$_pkgname-git"
pkgver=0.5.4.r37.gd558bc9d
pkgrel=1
pkgdesc="Simple vector animation program"
url="https://gitlab.com/mattbas/glaxnimate"
license=('GPL3')
arch=('x86_64' 'i686' 'armv7h' 'aarch64' 'riscv32' 'riscv64')

depends=(
  'ffmpeg'
  'hicolor-icon-theme'
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
  'clang'
  'cmake'
  'gcc'
  'git'
  'make'
  'qt6-declarative'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

_source_glaxnimate_git() {
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

  _prepare_glaxnimate_git() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['kde.breeze-icons']='data/icons/breeze-icons'
      ['mattbas.cmake-lib']='cmake'
      ['mattbas.python-lottie']='data/lib/python-lottie'
      ['mattbas.qt-color-widgets']='external/Qt-Color-Widgets'
      ['mattbas.qt-history-lineedit']='external/Qt-History-LineEdit'
      ['pybind.pybind11']='external/QtAppSetup/external/pybind11'
      ['rpavlik.cmake-modules']='external/cmake-modules'
    )
    _submodule_update
  )
}

_submodule_update() {
  local key
  for key in ${!_submodules[@]} ; do
    git submodule init "${_submodules[${key}]}"
    git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
    git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
  done
}

_source_glaxnimate_git

prepare() {
  _prepare_glaxnimate_git
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_BUILD_TYPE=Release
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
  cmake --build build --target translations
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}
