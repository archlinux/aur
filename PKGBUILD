# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>

pkgname=np2kai-git
pkgver=0.86.rev.22.216.g36df8cd
pkgrel=1
pkgdesc="Neko Project II Kai, a PC-9801 emulator. (GIT version)"
arch=('x86_64')
url='http://domisan.sakura.ne.jp/article/np2kai/np2kai.html'
license=('MIT')
depends=(
  'glibc'
  'glib2' 'libglib-2.0.so' 'libgobject-2.0.so'
  'libgcc' 'libgcc_s.so'
  'libstdc++' 'libstdc++.so'
  'libx11'
  'openssl' 'libcrypto.so'
  'libusb' 'libusb-1.0.so'
  'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so'
  'gtk2' 'libgtk-x11-2.0.so'
  'sdl2-compat'
  'sdl2_ttf'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cmake'
  'nasm'
  'ninja'
)
conflicts=('np2kai')
provides=('np2kai')
source=(
  'git+https://github.com/AZO234/NP2kai.git'
  'https://github.com/AZO234/NP2kai/commit/3d23274eefcf9c494358662539c29eebd8996cbf.patch'
  'https://github.com/AZO234/NP2kai/commit/697fac371b414212526aae25e7c9774f167f4ef3.patch'
  'https://github.com/amuramatsu/NP2kai/commit/ad781a4db34bc2364a377cc7bd90b3b99fea1459.patch'
  )
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd NP2kai
  _ver="$(cat np2ver.h | grep -m1 NP2VER_CORE | cut -d ' ' -f2,3 | cut -d '"' -f1)"
  echo "${_ver}.$(git describe --long --tags | tr - .)"
}

prepare() {
  cd NP2kai

  patch -p1 -i "${srcdir}/3d23274eefcf9c494358662539c29eebd8996cbf.patch"
  patch -p1 -i "${srcdir}/697fac371b414212526aae25e7c9774f167f4ef3.patch"
  patch -p1 -i "${srcdir}/ad781a4db34bc2364a377cc7bd90b3b99fea1459.patch"
  sed '/set(COMMON_C_CXX_FLAGS/s/^/#/g' -i CMakeLists.txt
  sed 's|target_include_directories(NP2kai_SDL2_base INTERFACE|& ${SDL_INCLUDE_DIRS} ${SDL_TTF_INCLUDE_DIRS}|g' -i CMakeLists.txt
  sed 's|SDL2_ttf/SDL_ttf.h|SDL2/SDL_ttf.h|g' -i sdl/fontmng.c -i x/fontmng.c
  sed '1i#include <SDL2/SDL_ttf.h>' -i sdl/fontmng.c
  sed 's|#include <SDL3/SDL.h>|#include <SDL2/SDL.h>|g' -i compiler_base.h
}

build() {
  pushd NP2kai
  export NP2KAI_VERSION="$(git describe --tags --abbrev=0)"
  export NP2KAI_HASH="$(git rev-parse --short HEAD)"
  popd

  cmake -S NP2kai -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man/man1 \
    -DBUILD_X=ON \
    -DBUILD_SDL=ON \
    -DBUILD_I286=ON \
    -DBUILD_HAXM=ON \
    -DUSE_X=ON \
    -DUSE_SDL=2 \
    -DUSE_HAXM=OFF \
    -DUSE_ASYNCCPU=ON \
    -DUSE_VST3SDK=OFF \
    -DCMAKE_C_FLAGS="-Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion" \
    -DCMAKE_CXX_FLAGS="-fno-sized-deallocation" \
    -G Ninja

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 NP2kai/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
