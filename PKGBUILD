# Maintainer: aur.chaotic.cx
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Curtis Smith <kman922002@gmail.com>

_pkgname="odamex"
pkgname="$_pkgname"
pkgver=12.2.0
pkgrel=2
pkgdesc='A free client/server multiplayer engine for the classic FPS Doom'
url="https://github.com/odamex/odamex"
license=('GPL-2.0-or-later')
arch=('x86_64' 'aarch64')

depends=(
  'libcurl.so'        # curl
  'libfltk.so'        # fltk
  'libfltk_images.so' # fltk
  'libjsoncpp.so'     # jsoncpp
  'libminiupnpc.so'   # miniupnpc
  'libpng16.so'       # libpng
  'libportmidi.so'    # portmidi
  'libz.so'           # zlib
  'libzstd.so'        # zstd
  'sdl2'
  'sdl2_mixer'
  'wxwidgets-gtk3'
)
makedepends=(
  'cmake'
  'deutex' # AUR
  'git'
  'ninja'
)
optdepends=(
  'timidity++: Required for the SDL2 MIDI music backend'
  'doomseeker: Online Doom multiplayer server launcher'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('f7f04ee9fe97afbfdae9c52faef5ae2c4c55fc9b6061cc8d8c4c02d39ff80d53')

prepare() {
  cd "$_pkgsrc"
  git rm -r libraries/curl
  git rm -r libraries/fltk
  git rm -r libraries/jsoncpp
  git rm -r libraries/libpng
  git rm -r libraries/miniupnp
  git rm -r libraries/portmidi
  git rm -r libraries/zlib

  git submodule update --init --depth 1
}

build() {
  export CFLAGS CXXFLAGS
  CFLAGS+=" -DSDL20"
  CXXFLAGS+=" -DSDL20"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_TESTING=OFF
    -Wno-dev

    -DBUILD_OR_FAIL=ON
    -DUSE_LTO=OFF

    -DENABLE_PORTMIDI=ON

    -DUSE_INTERNAL_CPPTRACE=ON
    -DUSE_INTERNAL_CURL=OFF
    -DUSE_INTERNAL_FLTK=OFF
    -DUSE_INTERNAL_JSONCPP=OFF
    -DUSE_INTERNAL_LIBADLMIDI=ON
    -DUSE_INTERNAL_PNG=OFF
    -DUSE_INTERNAL_WXWIDGETS=OFF
    -DUSE_INTERNAL_ZLIB=OFF
    -DUSE_INTERNAL_ZSTD=OFF

    -DUSE_MINIUPNP=ON
    -DUSE_INTERNAL_MINIUPNP=OFF
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
