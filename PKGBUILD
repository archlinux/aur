# Maintainer:
# Contributor: nm10923 https://nm10923.xyz/contact

_pkgname="sdl3_ttf"
pkgname="$_pkgname-git"
pkgver=3.1.0.r7.g3d7b6ef
pkgrel=1
pkgdesc="Support for TrueType font files with Simple Directmedia Layer (Version 3)"
url="https://github.com/libsdl-org/SDL_ttf"
license=('Zlib')
arch=('x86_64')

depends=(
  'sdl3'
  'freetype2'
  'harfbuzz'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=(
  "$_pkgname=${pkgver%.g*}"
  "libSDL3_ttf.so"
)
conflicts=("$_pkgname")

_pkgsrc="SDL_ttf"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DSDLTTF_SAMPLES=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$_pkgsrc/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
