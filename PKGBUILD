# Maintainer:
# Contributor: Stefan Biereigel <$(base64 --decode <<<'c3RlZmFuQGJpZXJlaWdlbC5kZQo=')>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>
# Contributor: Sebastian Bøe <$(base64 --decode <<<'c2ViYXN0aWFuYm9vZUBnbWFpbC5jb20K')>

: ${_build_python:=true}
: ${_build_patch:=true}

: ${_commit=}

_pkgname="yosys"
pkgname="$_pkgname-git"
pkgver=0.58.r155.g691d6b8
pkgrel=1
pkgdesc="A framework for RTL synthesis"
url="https://github.com/YosysHQ/yosys"
arch=('x86_64' 'i686')
license=('ISC')

depends=(
  'boost-libs'
  'gtkwave' # vcd2fst
  'libffi'
  'tcl'
)
makedepends=(
  'boost'
  'git'
  'python'
)
optdepends=(
  'graphviz: Schematics display support'
  'xdot: Design netlist display support'
)
checkdepends=(
  'iverilog'
)

if [[ "${_build_python::1}" == "t" ]]; then
  depends+=(
    'pybind11'
    'python'
    'python-click'
  )
  makedepends+=(
    'python-cxxheaderparser' # AUR

    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
  )
fi

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git${_commit:+#commit=$_commit}"
  "git+https://github.com/YosysHQ/abc.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

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
  git submodule init
  git config submodule.abc.url "$srcdir/abc"
  git -c protocol.file.allow=always submodule update

  if [[ "${_build_patch::1}" == "t" ]]; then
    patch -Np1 -F100 -i ../0001-verilog-port-renaming.patch
    patch -Np1 -F100 -i ../0002-verilog-port-renaming-tests.patch
  fi

  # disable lto
  sed -e '/flto/d' -i Makefile
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_make() {
  local _make_config=(
    CONFIG=gcc
    PREFIX="/usr"
    ENABLE_LIBYOSYS=1
    STRIP=':'
  )

  if [[ "${_build_python::1}" == "t" ]]; then
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    local python_version_combined=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    export BOOST_PYTHON_LIB="-lpython${python_version} -lboost_python${python_version_combined}"

    _make_config+=(
      ENABLE_PYOSYS=1
      PYOSYS_USE_UV=0
    )
  else
    _make_config+=(ENABLE_PYOSYS=0)
  fi

  make "${_make_config[@]}" "$@"
}

build() {
  cd "$_pkgsrc"
  _make
}

check() {
  cd "$_pkgsrc"
  _make test
}

package() {
  cd "$_pkgsrc"
  _make DESTDIR="$pkgdir" PYTHON_PREFIX="$pkgdir/usr" install
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
