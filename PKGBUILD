# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird-git
pkgver=r70619.8303a558f1a
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
conflicts=(ladybird)
provides=(ladybird)
depends=(
  curl
  fast_float
  ffmpeg
  harfbuzz
  icu
  libavif
  libgl
  libjpeg-turbo
  libjxl
  libtiff
  libtommath
  libwebp
  qt6-base
  qt6-multimedia
  qt6-tools
  qt6-wayland
  sqlite
  ttf-liberation
  woff2
  
  libpng-apng # AUR
  skia # AUR
  angle # AUR
  simdutf-git # 'simdutf' is v6, we need v7.
)
makedepends=(autoconf-archive automake cmake git nasm ninja tar unzip zip)
options=('!lto' '!debug' '!buildflags' '!staticlibs' '!emptydirs')
source=(
  "git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd ladybird
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"

  export PKG_CONFIG_PATH=$(realpath .)

  local use_linker=
  if ! echo $'#if defined(__clang__)\nWE ARE ON CLANG\n#endif' | "${CC:-/usr/bin/cc}" -E - | grep -q 'WE ARE ON CLANG'; then
    echo "Disabling LTO on Release build with GCC"
    use_linker='-DENABLE_LTO_FOR_RELEASE=OFF'
  fi

  cmake \
    -B build \
    -S ladybird \
    -DBUILD_SHARED_LIBS=OFF \
    -DLADYBIRD_CACHE_DIR=Build/caches \
    -DCMAKE_BUILD_TYPE=Release \
    $use_linker \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_INSTALL_HEADERS=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR="lib/${pkgname%-git}" \
    -GNinja \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  find "$pkgdir" -name '*.a' -delete
  find "$pkgdir" -name '*.cmake' -delete

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
