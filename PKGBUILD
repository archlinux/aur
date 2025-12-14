# Maintainer:
# Contributor: Romeo Calota <mail@romeocalota.me>

_pkgname="joyshockmapper"
pkgname="$_pkgname-git"
pkgver=3.6.1.r10.gbb69784
pkgrel=1
pkgdesc="Game controller remapper with gyro aiming and flick stick support"
url="https://github.com/Electronicks/JoyShockMapper"
license=('MIT')
arch=('x86_64')

depends=(
  'libevdev'
  'gtk3'
  'libappindicator'
  'sdl3'
)
makedepends=(
  'cmake'
  'clang'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('debug' '!lto' '!strip')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  '0001-use-system-sdl3.patch'
  '0002-fix-status-notifier-segfault.patch'
)
sha256sums=(
  'SKIP'
  '8c11b618974407aebd54fc7c84cd1cdc18ba77811e92afc69883cae2a58af510'
  'ad89986cc51f5d52b970d1979d0f6a9da659a22bab47daccb7f9ba95ad349b92'
)

prepare() {
  cd "$_pkgsrc"

  patch -Np1 -F100 -i ../0001-use-system-sdl3.patch
  patch -Np1 -F100 -i ../0002-fix-status-notifier-segfault.patch

  sed -e '1i #include <algorithm>' -i JoyShockMapper/src/TriggerEffectGenerator.cpp
  sed -e '1i #include <chrono>' -i JoyShockMapper/include/Gamepad.h
}

pkgver() {
  cd "$_pkgsrc"
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
