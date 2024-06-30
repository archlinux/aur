# Maintainer:
# Contributor: GodofGrunts <me@godofgrunts.xyz>

_pkgname="libresprite"
pkgname="$_pkgname-git"
pkgver=1.0.r245.gc99d366
pkgrel=1
pkgdesc="Animated sprite editor and pixel art tool"
url='https://github.com/LibreSprite/LibreSprite'
license=('GPL-2.0-only')
arch=('x86_64' 'i686')

depends=(
  'curl'
  'freetype2'
  'giflib'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'lua'
  'pixman'
  'sdl2'
  'sdl2_image'
  'tinyxml2'
  'zlib'
)
makedepends=(
  'cmake'
  'git'
  'gtest'
)

provides=(
  libresprite
)
conflicts=(
  aseprite
  libresprite
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/LibreSprite/LibreSprite.git"

  'clip'::'git+https://github.com/aseprite/clip.git'
  'duktape'::'git+https://github.com/libresprite/duktape.git'
  'flic'::'git+https://github.com/aseprite/flic.git'
  'observable'::'git+https://github.com/dacap/observable.git'
  'simpleini'::'git+https://github.com/aseprite/simpleini.git'
  'undo'::'git+https://github.com/aseprite/undo.git'
)

sha256sums=(
  'SKIP'

  'SKIP'
  'SKIP'
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
    'clip'::'src/clip'
    'duktape'::'third_party/duktape'
    'flic'::'src/flic'
    'observable'::'src/observable'
    'simpleini'::'third_party/simpleini'
    'undo'::'src/undo'
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

    -DCMAKE_INSTALL_PREFIX="/usr"
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$pkgdir/usr/share/libresprite/data/icons/ase64.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=${_pkgname^}
GenericName=Pixel Art Editor
Keywords=aseprite
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
Categories=Graphics;2DGraphics;RasterGraphics;
MimeType=image/bmp;image/gif;image/jpeg;image/png;image/x-pcx;image/x-tga;image/vnd.microsoft.icon;video/x-flic;image/webp;image/x-aseprite;
END
}
