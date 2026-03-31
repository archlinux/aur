# Maintainer:
# Contributor: Romeo Calota <mail@romeocalota.me>

_pkgname="joyshockmapper"
pkgname="$_pkgname-git"
pkgver=3.6.1.r14.g416502e
pkgrel=1
pkgdesc="Game controller remapper with gyro aiming and flick stick support"
url="https://github.com/CoderMaximus/JoyShockMapper-linux"
license=('MIT')
arch=('x86_64')

depends=(
  'gtk3'
  'libappindicator'
  'libevdev'
  'sdl3'
)
makedepends=(
  'clang'
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!lto')

_pkgsrc="$_pkgname-linux"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-use-system-sdl3.patch'
)
sha256sums=(
  'SKIP'
  '8c11b618974407aebd54fc7c84cd1cdc18ba77811e92afc69883cae2a58af510'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

pkgver() {
  cd "$_pkgsrc"
  git tag -f v3.6.1 b36a72be051a43a48165580d6d18cf92d301a02a
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export CC=clang
  export CXX=clang++

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

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
