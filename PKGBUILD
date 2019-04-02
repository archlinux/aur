# Maintainer: Michael Koloberdin <koloberdin@gmail.com>
pkgname=unreal-speccy-portable-git
pkgver=0.0.83.r1.ged823c7
pkgrel=3
pkgdesc="Portable ZX Spectrum emulator based on UnrealSpeccy 0.37.3 by SMT"
arch=('x86_64')
_reponame='unrealspeccyp'
url="https://bitbucket.org/djdron/${_reponame}"
license=('GPL')
depends=('sdl2' 'curl' 'mesa')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://bitbucket.org/djdron/${_reponame}")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_reponame}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
