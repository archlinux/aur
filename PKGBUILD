# Maintainer:
# Contributor: GodofGrunts <me@godofgrunts.xyz>

export CMAKE_POLICY_VERSION_MINIMUM=3.5

_pkgname="libresprite"
pkgname="$_pkgname-git"
pkgver=1.2.r8.gdaad25b
pkgrel=1
pkgdesc="Animated sprite editor and pixel art tool"
url='https://github.com/LibreSprite/LibreSprite'
license=('GPL-2.0-only')
arch=('x86_64' 'i686')

depends=(
  'curl'
  'freetype2'
  'giflib'
  'libarchive'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'libxcb'
  'libxi'
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
  'ninja'
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

  'aseprite.clip'::'git+https://github.com/aseprite/clip.git'
  'aseprite.flic'::'git+https://github.com/aseprite/flic.git'
  'aseprite.simpleini'::'git+https://github.com/aseprite/simpleini.git'
  'aseprite.undo'::'git+https://github.com/aseprite/undo.git'
  'libresprite.duktape'::'git+https://github.com/libresprite/duktape.git'
)

sha256sums=(
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
    'aseprite.clip'::'src/clip'
    'aseprite.flic'::'src/flic'
    'aseprite.simpleini'::'third_party/simpleini'
    'aseprite.undo'::'src/undo'
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
