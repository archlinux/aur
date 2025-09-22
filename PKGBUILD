# Mantainer:
# Contributor: PumpkinCheshire <me@pumpkincheshire.top>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Utkan Güngördü <utkan@freeconsole.org>

_pkgname="waifu2x-ncnn-vulkan"
pkgname="$_pkgname-git"
pkgver=20250915.r0.ga86cfb0
pkgrel=1
pkgdesc="ncnn implementation of waifu2x converter"
url="https://github.com/nihui/waifu2x-ncnn-vulkan"
arch=('i686' 'x86_64' 'aarch64')
license=('MIT')

depends=(
  'libjpeg'
  'libpng'
  'libwebp'
  'ncnn'
  'zlib-ng'
)
makedepends=(
  'cmake'
  'git'
  'glslang'
  'ninja'
  'vulkan-headers'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"

  # Fix default model path
  sed -i 's|path_t model = PATHSTR("models-cunet")|path_t model = PATHSTR("/usr/share/waifu2x-ncnn-vulkan/models-cunet")|' src/main.cpp
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc/src"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DUSE_SYSTEM_JPEG=ON
    -DUSE_SYSTEM_NCNN=ON
    -DUSE_SYSTEM_PNG=ON
    -DUSE_SYSTEM_WEBP=ON
    -DUSE_SYSTEM_ZLIB=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 build/waifu2x-ncnn-vulkan -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd "$_pkgsrc/models"
  for f in models-*/*; do
    install -Dm644 "$f" "$pkgdir/usr/share/$_pkgname/$f"
  done
}
