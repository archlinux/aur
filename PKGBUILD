# Maintainer:
# Contributor: FFY00 <filipe.lains@gmail.com>

_pkgname="gr-limesdr"
pkgname="$_pkgname-git"
pkgver=3.0.1.r69.gd0fac85
pkgrel=3
pkgdesc="gr-limesdr Plugin for GNURadio"
url="https://github.com/myriadrf/gr-limesdr"
license=('MIT')
arch=('x86_64')

depends=(
  'gnuradio'
  'limesuite'
  'python'
  'spdlog'
)
makedepends=(
  'boost'
  'cmake'
  'doxygen'
  'git'
  'ninja'
  'pybind11'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git#branch=gr-3.10")
  sha256sums=('SKIP')
}

_source_fmt() {
  _commit_fmt='e69e5f977d458f2650bb346dadf2ad30c5320281' # 10.2.1

  source+=("fmtlib.fmt"::"git+https://github.com/fmtlib/fmt.git#commit=$_commit_fmt")
  sha256sums+=('SKIP')
}

_source_main
_source_fmt

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_build_main() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Dfmt_DIR="$srcdir/deps/usr/lib/cmake/fmt"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

_build_fmt() {
  echo "Building fmt..."

  local _cmake_options=(
    -B build_fmt
    -S "fmtlib.fmt"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DFMT_CMAKE_DIR='lib/cmake/fmt'
    -DFMT_DOC=OFF
    -DFMT_INC_DIR='include/fmt'
    -DFMT_PKGCONFIG_DIR='lib/fmt/pkgconfig'
    -DBUILD_SHARED_LIBS=OFF

    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build_fmt
  DESTDIR="$srcdir/deps" cmake --install build_fmt
}

build() {
  (_build_fmt)
  (_build_main)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
