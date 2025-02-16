# Maintainer:
# Contributor: FFY00 <filipe.lains@gmail.com>

## options
: ${build_fmt:=true}
: ${_commit_fmt=e69e5f977d458f2650bb346dadf2ad30c5320281} # 10.2.1

_pkgname="gr-limesdr"
pkgname="$_pkgname-git"
pkgver=3.0.1.r69.gd0fac85
pkgrel=4
pkgdesc="gr-limesdr Plugin for GNURadio"
url="https://github.com/myriadrf/gr-limesdr"
license=('MIT')
arch=('x86_64')

depends=(
  'libgnuradio-pmt.so'     # gnuradio
  'libgnuradio-runtime.so' # gnuradio
  'libspdlog.so'           # spdlog
  'limesuite'
  'python'
)
makedepends=(
  'boost'
  'cmake'
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
  if [ "${build_fmt::1}" != "t" ]; then
    depends+=('libfmt.so') # fmt
    return
  fi

  source+=("fmtlib.fmt"::"git+https://github.com/fmtlib/fmt.git#commit=$_commit_fmt")
  sha256sums+=('SKIP')

  _build_fmt() (
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
      -DFMT_TEST=OFF
      -DBUILD_SHARED_LIBS=OFF
      -Wno-dev
    )

    echo "Building fmt..."
    cmake "${_cmake_options[@]}"
    cmake --build build_fmt
    DESTDIR="$srcdir/deps" cmake --install build_fmt
  )
}

_source_main
_source_fmt

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  _run_if_exists _build_fmt

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  if [[ "${build_fmt::1}" == "t" ]]; then
    _cmake_options+=(-Dfmt_DIR="$srcdir/deps/usr/lib/cmake/fmt")
  fi

  echo "Building gr-limesdr..."
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

_run_if_exists() {
  if declare -F "$1" > /dev/null; then
    eval "$1"
  fi
}
