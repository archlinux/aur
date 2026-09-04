# Maintainer:
# Contributor: Fabio 'Lolix' Loli
# Contributor: Daurnimator <quae@daurnimator.com>
# Contributor: Jens Staal <staal1978@gmail.com>

## Known issue: cmake uses absolute paths which result in binaries containing
## build root via __FILE__ macro

pkgname=arcan
pkgver=0.7.1
pkgrel=1
pkgdesc="Game Engine meets a Display Server meets a Multimedia Framework"
arch=(x86_64)
url="https://arcan-fe.com"
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
         sdl2-compat
         sqlite
         tesseract
         wayland
         xcb-util-wm

         # namcap implicit depends
         file gcc-libs glibc libdrm libglvnd libusb libxcb)
makedepends=(cmake git meson ruby wayland-protocols xcb-util)
source=("https://codeberg.org/letoram/arcan/archive/$pkgver.tar.gz")
b2sums=('9584e9310aa9c16599cd80f538173b7d4d0d3ea255bb91893615682d12d3f2285be9fc2578ea13031b84333228f2ec68b3934870bba7490b889ad2116ea97f36')

prepare() {
  cd $pkgname/external/git

  ./clone.sh
}

build() {
  cd $pkgname

  export CFLAGS+=" -Wno-error=format-security"
  export CXXFLAGS+=" -Wno-error=format-security"

  ## Build docs, Needs to happen before cmake runs
  ruby -C doc -Ku docgen.rb mangen

  cmake -B build -S src -Wno-dev           \
    -DBUILD_PRESET="everything"            \
    -DCMAKE_BUILD_TYPE=None                \
    -DCMAKE_INSTALL_PREFIX=/usr            \
    -DDISABLE_JIT=ON                       \
    -DDISTR_TAG=arch                       \
    -DENGINE_BUILDTAG="$pkgver-$pkgrel"    \
    -DLUA_INCLUDE_DIR=/usr/include/lua5.1  \
    -DHYBRID_HEADLESS=ON                   \
    -DHYBRID_SDL=ON                        \

  cmake --build build
}

package() {
  cd $pkgname

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
