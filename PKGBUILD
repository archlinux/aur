# Maintainer: 
# Contributor: Fabio 'Lolix' Loli
# Contributor: Daurnimator <quae@daurnimator.com>
# Contributor: Jens Staal <staal1978@gmail.com>

## Known issue: cmake uses absolute paths which result in binaries containing
## build root via __FILE__ macro

pkgname=arcan
pkgver=0.7.0.1
pkgrel=1
pkgdesc="Game Engine meets a Display Server meets a Multimedia Framework"
arch=(x86_64)
url="https://github.com/letoram/arcan"
license=(GPL LGPL BSD)
depends=(espeak-ng
         ffmpeg
         freetype2
         harfbuzz
         leptonica
         libseccomp
         #libuvc # TODO: using vendored copy until moved to community
         libvlc
         libvncserver
         libxkbcommon
         lua51 # Doesn't compile against LuaJIT 2.1 due to deprecated ref API usage
         mesa
         libmupdf
         openal
         sdl2
         sqlite
         tesseract
         wayland
         xcb-util-wm

         # namcap implicit depends
         libusb glibc libxcb gcc-libs file libglvnd libdrm
         )
makedepends=(cmake meson ruby wayland-protocols xcb-util)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/letoram/arcan/archive/${pkgver}.tar.gz")
sha256sums=('63d925d100389e7a1074a8746a080a01d94739df487c2f8e311eb49adc006c6e')

build() {
  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  ## Build docs, Needs to happen before cmake runs
  ruby -C ${pkgname}-${pkgver}/doc -Ku docgen.rb mangen

  local _flags=(
    -DDISABLE_JIT=ON
    -DDISTR_TAG=arch
    -DENGINE_BUILDTAG="${pkgver}-${pkgrel}"
    -DLUA_INCLUDE_DIR=/usr/include/lua5.1
    -DHYBRID_HEADLESS=ON
    #-DHYBRID_SDL=ON
  )

  cmake -B build -S "${pkgname}-${pkgver}/src" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${pkgname}-${pkgver}/"COPYING -t "$pkgdir/usr/share/licenses/${pkgname}/"
}
