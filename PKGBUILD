# Maintainer:
# Contributor: GodofGrunts <me@godofgrunts.xyz>

_pkgname="libresprite"
pkgname="$_pkgname-git"
pkgver=1.2.r14.g94f52fa
pkgrel=1
pkgdesc="Animated sprite editor and pixel art tool"
url='https://github.com/LibreSprite/LibreSprite'
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
source=(
  "$_pkgsrc"::"git+https://github.com/LibreSprite/LibreSprite.git"
  'aseprite.flic'::'git+https://github.com/aseprite/flic.git'
  'aseprite.simpleini'::'git+https://github.com/aseprite/simpleini.git'
  'libresprite.duktape'::'git+https://github.com/libresprite/duktape.git'
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  local _submodules=(
    'aseprite.flic'::'src/flic'
    'aseprite.simpleini'::'third_party/simpleini'
    'libresprite.duktape'::'third_party/duktape'
  )
  local _module
  for _module in "${_submodules[@]}"; do
    git submodule init "${_module##*::}"
    git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
    git -c protocol.file.allow=always submodule update "${_module##*::}"
  done
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
    -Wno-dev
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
