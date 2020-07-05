# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf-git
_pkgname=ecwolf
pkgver=1.3.3.r359.gdee8991
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL (development version)'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL' 'custom: ID')
provides=('ecwolf')
conflicts=('ecwolf')
depends=('libvorbis' 'flac' 'opusfile' 'libmodplug' 'fluidsynth' 'libjpeg' 'sdl2' 'sdl2_net')
makedepends=('git' 'cmake' 'sdl')
optdepends=('wolf3d-shareware: Demo version of Wolfenstein 3D')
#install=ecwolf.install
source=("git+https://bitbucket.org/ecwolf/ecwolf"
        "git+https://bitbucket.org/ecwolf/sdl_mixer-for-ecwolf")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  echo "Building custom SDL_mixer..."
  cmake -B mixer-build sdl_mixer-for-ecwolf -DMAKE_SHARED=OFF -DDYN_FLUIDSYNTH=OFF
  make -C mixer-build SDL2_mixer

  echo "Building ecwolf..."
  # enable gpl licensed opl emulator and force custom SDL2_mixer with dependency libraries
  export LDFLAGS="-lvorbisfile -lopusfile -lFLAC  -lmodplug -lfluidsynth $LDFLAGS"
  cmake -B build ecwolf -DGPL=ON \
    -DSDL2_mixer_INCLUDE_DIRS="$srcdir/sdl_mixer-for-ecwolf" \
    -DSDL2_mixer_LIBRARIES="$srcdir/mixer-build/libSDL_mixer.a"
  make -C build
}

package() {
  cd build

  # binaries
  install -Dm755 ecwolf "$pkgdir"/usr/bin/ecwolf
  # data
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
  cd ../ecwolf
  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 README.* "$pkgdir"/usr/share/doc/$pkgname
  # license
  install -Dm644 docs/license-id.txt "$pkgdir"/usr/share/licenses/$pkgname/license-id.txt
}
