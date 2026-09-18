# Maintainer:
# Contributor: GodofGrunts <me@godofgrunts.xyz>

_pkgname="libresprite"
pkgname="$_pkgname-git"
pkgver=1.2.r49.g5b283d7
pkgrel=1
pkgdesc="Animated sprite editor and pixel art tool, based on the last GPL2 commit of Aseprite"
url="https://github.com/LibreSprite/LibreSprite"
license=('GPL-2.0-only')
arch=('x86_64' 'i686')

depends=(
  'freetype2'
  'giflib'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'libxi'
  'pixman'
  'sdl2'
  'sdl2_image'
  'tinyxml2'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_SDL2_BACKEND=ON
    -DWITH_WEBP_SUPPORT=ON
    -DWITH_DESKTOP_INTEGRATION=ON
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # prevent conflict with aseprite
  mv "$pkgdir/usr/share/mime/packages"/{aseprite,libresprite}.xml
  sed -e '/icon name/s/aseprite/libresprite/' \
    -e '/comment/s&Aseprite \(Pixel Art\)&Libresprite \1&' \
    -i "$pkgdir/usr/share/mime/packages/libresprite.xml"
}
