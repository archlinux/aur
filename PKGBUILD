# Maintainer:
# Contributor: FFY00 <filipe.lains@gmail.com>

_pkgname="gr-limesdr"
pkgname="$_pkgname-git"
pkgver=3.0.1.r69.gd0fac85
pkgrel=6
pkgdesc="gr-limesdr Plugin for GNURadio"
url="https://github.com/myriadrf/gr-limesdr"
license=('MIT')
arch=('x86_64')

depends=(
  'libfmt.so'              # fmt
  'libgnuradio-pmt.so'     # gnuradio
  'libgnuradio-runtime.so' # gnuradio
  'libspdlog.so'           # spdlog
  'limesuite'
  'python'
  'python-gnuradio'
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

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#branch=gr-3.10")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CXXFLAGS+=' -fpermissive'

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

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  DESTDIR="$srcdir/test" cmake --install build
  PYTHONPATH="$srcdir/test/$_site_packages" LD_LIBRARY_PATH="$srcdir/test/usr/lib" python -c 'import limesdr'
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm 644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
