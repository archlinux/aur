# Maintainer: Ali Mohammad Pur <totally@fakegmail.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird-git
pkgver=r70236.a8fc15c6b30
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
conflicts=(ladybird)
provides=(ladybird)
depends=(
  curl
  ffmpeg
  libgl
  qt6-base
  qt6-multimedia
  qt6-tools
  qt6-wayland
  ttf-liberation
  libtommath
  fast_float
  simdutf
  
  libpng-apng # AUR
  skia # AUR
  angle # AUR
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
    -DSERENITY_CACHE_DIR=Build/caches \
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

  install -Dm644 "ladybird/Meta/CMake/freedesktop/org.ladybird.Ladybird.desktop" "${pkgdir}/usr/share/applications/ladybird.desktop"
  install -Dm644 "ladybird/Base/res/icons/128x128/app-browser.png" "${pkgdir}/usr/share/pixmaps/ladybird.png"

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
