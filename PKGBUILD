# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=unreal-speccy-portable
pkgver=0.0.83
pkgrel=3
pkgdesc="Portable ZX Spectrum emulator based on UnrealSpeccy 0.37.3 by SMT"
arch=('x86_64')
_reponame='unrealspeccyp'
url="https://bitbucket.org/djdron/${_reponame}"
license=('GPL')
depends=('sdl2' 'curl' 'mesa')
makedepends=('cmake' 'git')
source=("https://bitbucket.org/djdron/${_reponame}/get/v${pkgver}.tar.bz2")
sha512sums=('a5f5067962131d416f2538e1696d52a5baa04bc6278b420de3d3d391e1c73414a05fa1a6175d091788cdb0a29268736e342cc812c611b8587bc9357b5dcd5ea3')

prepare() {
  cd "$srcdir"
  mv djdron-${_reponame}* $_reponame
}

build() {
  cd "$srcdir/${_reponame}/build/cmake"
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_SDL=Off -DUSE_SDL2=On \
    -DSDL2_INCLUDE_DIRS="/usr/include" \
    -DCMAKE_CXX_FLAGS="`sdl2-config --cflags`" \
    -DCMAKE_EXE_LINKER_FLAGS="`sdl2-config --libs`"
  make
}

package() {
  cd "$srcdir/${_reponame}"

  install -Dm755 build/cmake/build/unreal_speccy_portable \
    "$pkgdir"/usr/lib/unreal-speccy-portable/unreal_speccy_portable

  install -dm755 "$pkgdir"/usr/lib/unreal-speccy-portable/res
  cp -r res "$pkgdir"/usr/lib/unreal-speccy-portable

  cd build/install/linux/debian

  install -Dm755 usr/bin/unreal-speccy-portable \
    "$pkgdir"/usr/bin/unreal-speccy-portable

  install -Dm644 usr/share/applications/unreal-speccy-portable.desktop \
    "$pkgdir"/usr/share/applications/unreal-speccy-portable.desktop

  for size in 22x22 24x24 32x32 48x48 64x64 128x128; do
    install -Dm644 usr/share/icons/hicolor/$size/apps/unreal_speccy_portable.png \
      "$pkgdir"/usr/share/icons/hicolor/$size/apps/unreal_speccy_portable.png
  done

  install -Dm644 usr/share/mime/packages/unreal_speccy_portable.xml \
    "$pkgdir"/usr/share/mime/packages/unreal_speccy_portable.xml

}

# vim:set ts=2 sw=2 et:
