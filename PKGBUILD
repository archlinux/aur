# Maintainer:

_pkgname="cvise"
pkgname="$_pkgname-git"
pkgver=2.11.0.r30.gf560d02
pkgrel=1
pkgdesc="Super-parallel Python port of the C-Reduce"
url="https://github.com/marxin/cvise"
license=('NCSA')
arch=('x86_64')

depends=(
  'clang'
  'flex'
  'python'
  'python-chardet'
  'python-jsonschema'
  'python-pebble' # AUR
  'python-psutil'
  'python-pytest'
  'python-zstandard'
  'unifdef'
)
makedepends=(
  'cmake'
  'git'
  'llvm'
  'ninja'
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
  python -m compileall -f -p / -s "$pkgdir" "$pkgdir/"
}
