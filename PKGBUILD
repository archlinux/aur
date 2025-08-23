# Maintainer:

_pkgname="cvise"
pkgname="$_pkgname-git"
pkgver=2.11.0.r124.g07b1d05
pkgrel=1
pkgdesc="Super-parallel Python port of the C-Reduce"
url="https://github.com/marxin/cvise"
license=('NCSA')
arch=('x86_64')

depends=(
  'clang'
  'flex'
  'python-chardet'
  'python-jsonschema'
  'python-msgspec' # AUR
  'python-pebble'  # AUR
  'python-psutil'
  'python-pytest'
  'python-zstandard'
  'tree-sitter-cli'
  'unifdef'
)
makedepends=(
  'cmake'
  'git'
  'llvm'
  'ninja'
  'python'
)
optdepends=('colordiff')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

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
    -DCMAKE_INSTALL_LIBEXECDIR='lib'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --rerun-failed --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # specify python version to prevent untracked pyc files
  local _pyver_major _pyver_minor
  _pyver_major=$(python -c 'import sys; print(sys.version_info.major)')
  _pyver_minor=$(python -c 'import sys; print(sys.version_info.minor)')

  eval "depends+=(
    'python>=${_pyver_major}.${_pyver_minor}'
    'python<${_pyver_major}.$((_pyver_minor + 1))'
  )"

  # generate pyc files
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"
}
