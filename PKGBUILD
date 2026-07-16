# Maintainer:
# Contributor: Stefan Biereigel <$(base64 --decode <<<'c3RlZmFuQGJpZXJlaWdlbC5kZQo=')>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>
# Contributor: Sebastian Bøe <$(base64 --decode <<<'c2ViYXN0aWFuYm9vZUBnbWFpbC5jb20K')>

: ${_build_patch:=true}

_pkgname="yosys"
pkgname="$_pkgname-git"
pkgver=0.67.r40.g45ea2b8
pkgrel=1
pkgdesc="A framework for RTL synthesis"
url="https://github.com/YosysHQ/yosys"
arch=('x86_64' 'i686' 'aarch64')
license=('ISC')

depends=(
  'gtkwave' # vcd2fst
  'tcl'

  # for python module
  'python'
  'python-click'
)
makedepends=(
  'cmake'
  'git'
  'ninja'

  # for python module
  'pybind11'
  'python-build'
  'python-cxxheaderparser'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'graphviz: Schematics display support'
  'xdot: Design netlist display support'
)
checkdepends=(
  'iverilog'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

if [[ "${_build_patch::1}" == "t" ]]; then
  source+=(
    '0001-verilog-port-renaming.patch'
    '0002-verilog-port-renaming-tests.patch'
  )
  sha256sums+=(
    'ac658080f906a24d9015e35276ea58ee3565cf8d4171da9bd11f1e973fec5bda'
    '11913a84a3d51e5a71d194a8e0ae5092672d083d79bf55c42b2d5d0e4ac6d6d7'
  )
fi

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --depth=1

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=$CHECKFUNC
    -Wno-author

    -DYOSYS_INSTALL_DRIVER=ON
    -DYOSYS_INSTALL_LIBRARY=ON
    -DYOSYS_INSTALL_PYTHON=ON
    -DYOSYS_USE_BUNDLED_LIBS=ON
    -DYOSYS_WITH_PYTHON=ON
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build/tests/unit --rerun-failed --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc"/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
