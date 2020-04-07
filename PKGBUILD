# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=mkxp-git
pkgver=r822.9dc4291
pkgrel=1
pkgdesc="Open source implementation of the Ruby Game Scripting System of RPG Maker XP/VX/VX Ace (development version)"
arch=('i686' 'x86_64')
url="https://github.com/Ancurio/mkxp"
license=('GPL2')
depends=('ruby2.6' 'physfs' 'sdl2_image' 'sdl2_ttf' 'pixman' 'openal' 'boost-libs'
         'libgl' 'libsigc++' 'fluidsynth' 'libmodplug' 'libvorbis' 'flac')
makedepends=('git' 'boost' 'cmake' 'mesa' 'vim' 'ninja')
conflicts=('mkxp')
provides=('mkxp')
install=mkxp.install
source=("git+$url.git"
        "git+https://github.com/Ancurio/SDL_sound.git")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd mkxp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build

  cd mkxp

  # add our sdl_sound
  sed -e 's/SDL2_INCLUDE_DIRS/SDL_SOUND_INCLUDE_DIRS} ${&/' \
      -e 's/SDL2_LIBRARY_DIRS/SDL_SOUND_LIBRARY_DIRS} ${&/' \
      -e 's/SDL_SOUND_LIBRARIES}/& -logg -lFLAC -lmodplug/' -i CMakeLists.txt

  # hotfix for new openal soft
  grep -q ALCdevice_struct src/eventthread.h && \
    sed '/ALCdevice_struct/d;i #include <alc.h>' -i src/eventthread.h
}

build() {
  cd SDL_sound
  ./bootstrap
  ./configure --enable-static --disable-shared --prefix="$srcdir" \
              --disable-speex --disable-mikmod
  make install
  export PKG_CONFIG_PATH="$srcdir/lib/pkgconfig:/opt/ruby2.6/lib/pkgconfig"

  cd ../mkxp

  cmake -G Ninja -B ../build -DWORKDIR_CURRENT=ON -DSHARED_FLUID=ON \
        -DMRIVERSION=2.6 # fixme: build with 2.7
  cmake --build  ../build
}

package() {
  # install architecture dependent executeable
  install -Dm755 build/mkxp.bin.x* "$pkgdir"/usr/bin/mkxp

  # install documentation
  cd mkxp
  install -Dm644 README.md "$pkgdir"/usr/share/doc/mkxp/README.md
  install -m644 mkxp.conf.sample "$pkgdir"/usr/share/doc/mkxp
}
