# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
 
_pkgname=blend2d
pkgname=${_pkgname}-git
pkgver=0.21.3.r308.20260905.58ca946
pkgrel=1
pkgdesc='A high-performance 2D vector graphics engine written in C++'
url='https://blend2d.com'
arch=('i686' 'x86_64')
license=('Zlib')
depends=(
  'glibc'
  'libasmjit.so'
  'libstdc++.so'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'asmjit'
  'libstdc++'
  'python3'
)
provides=(
  "$_pkgname=${pkgver}"
  "libblend2d.so"
)
conflicts=(
  "$_pkgname"
  "libblend2d.so"
)
source=("${_pkgname}::git+https://github.com/blend2d/blend2d")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  _ver="$(python blend2d-version.py)"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "$_pkgname"

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  # "It's strongly advised to use Clang to compile Blend2D on all platforms to achieve maximum performance."
  export CC='clang'
  export CXX='clang++'

  # Build a shared library with tests and demo
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBLEND2D_DEMOS=ON \
    -DBLEND2D_EXTERNAL_ASMJIT=ON \
    -DBLEND2D_NO_FUTEX=OFF \
    -DBLEND2D_NO_INSTALL=OFF \
    -DBLEND2D_NO_JIT=OFF \
    -DBLEND2D_NO_JIT_LOGGING=OFF \
    -DBLEND2D_NO_NATVIS=OFF \
    -DBLEND2D_NO_STDCXX=OFF \
    -DBLEND2D_NO_TLS=OFF \
    -DBLEND2D_STATIC=OFF \
    -DBLEND2D_TEST=ON \
    -Wno-dev

  make
}

check() {
  cd "$_pkgname"/build
  ./bl_test_runner
}

package() {
  cd "$_pkgname"/build
  make DESTDIR="$pkgdir" install

  # Do not include the unit test program
  rm -rf "$pkgdir"/usr/bin

  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$pkgname" ../LICENSE.md
}
