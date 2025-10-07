# Maintainer:
# Contributor: Stefan Biereigel <$(base64 --decode <<<'c3RlZmFuQGJpZXJlaWdlbC5kZQo=')>
# Contributor: Patrick Lloyd <$(base64 --decode <<<'cGF0cmlja0BsbG95ZC5zaAo=')>
# Contributor: Sebastian Bøe <$(base64 --decode <<<'c2ViYXN0aWFuYm9vZUBnbWFpbC5jb20K')>

_pkgname="yosys"
pkgname="$_pkgname-git"
pkgrel=1
pkgver=0.57.r266.gb8b0f80
pkgdesc="A framework for RTL synthesis"
url="https://github.com/YosysHQ/yosys"
arch=('x86_64' 'i686')
license=('ISC')

depends=(
  'boost-libs'
  'gtkwave' # vcd2fst
  'libffi'
  'python'
  'tcl'
)
makedepends=(
  'boost'
  'git'
)
optdepends=(
  'graphviz: Schematics display support'
  'xdot: Design netlist display support'
)
checkdepends=(
  'iverilog'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "git+https://github.com/YosysHQ/abc.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "$_pkgsrc"
  git submodule init
  git config submodule.abc.url "$srcdir/abc"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

_make() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local python_version_combined=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  local _make_config=(
    CONFIG=gcc
    PREFIX="/usr"
    ENABLE_LIBYOSYS=1
    ENABLE_PYOSYS=1
    BOOST_PYTHON_LIB="-lpython${python_version} -lboost_python${python_version_combined}"
    STRIP=':'
  )

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
