# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf
pkgver=1.3.3
pkgrel=2
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL' 'custom: ID')
depends=('sdl' 'libvorbis' 'flac' 'opusfile' 'libmikmod' 'fluidsynth' 'libjpeg' 'gtk2')
makedepends=('cmake' 'mercurial')
optdepends=('wolf3d-shareware: Demo version of Wolfenstein 3D')
install=$pkgname.install
source=("http://maniacsvault.net/ecwolf/files/ecwolf/1.x/ecwolf-$pkgver-src.7z"
        "hg+https://bitbucket.org/ecwolf/sdl_mixer-for-ecwolf#revision=d3e4f997d2b1")
sha256sums=('b408268370ca810e4f22138f39a051fa64627211011869b9613da23a3d22e750'
            'SKIP')

prepare() {
  # reset build folders
  rm -rf build mixer-build
  mkdir build mixer-build

  # data dir hack
  sed -e 's|OpenResourceFile(datawad|OpenResourceFile("/usr/share/ecwolf/ecwolf.pk3"|' \
    -e 's|Push(datawad|Push("/usr/share/ecwolf/ecwolf.pk3"|' \
    -e 's|/usr/local/share/games/wolf3d|/usr/share/wolf3d|' \
    -i ecwolf-$pkgver-src/src/wl_iwad.cpp
}

build() {
  msg2 "Building custom SDL_mixer..."
  cd mixer-build
  cmake ../sdl_mixer-for-ecwolf
  make

  msg2 "Building ecwolf..."
  cd ../build
  # build patch utility, enable gpl licensed opl emulator and force custom SDL2_mixer with dependency libraries
  cmake ../ecwolf-$pkgver-src -DBUILD_PATCHUTIL=ON -DGPL=ON \
    -DSDLMIXER_INCLUDE_DIR="$srcdir/sdl_mixer-for-ecwolf" \
    -DSDLMIXER_LIBRARY="$srcdir/mixer-build/libSDL_mixer.a;-lfluidsynth;-lvorbisfile;-lvorbis;-lopusfile;-lopus;-lFLAC;-lmikmod;-logg"
  make
}

package() {
  cd build

  # binaries
  install -Dm755 ecwolf "$pkgdir"/usr/bin/ecwolf
  install -m755 tools/patchutil/patchutil "$pkgdir"/usr/bin/ecwolf-patchutil
  # data
  install -Dm644 ecwolf.pk3 "$pkgdir"/usr/share/ecwolf/ecwolf.pk3
  cd ../ecwolf-$pkgver-src
  # doc
  install -d "$pkgdir"/usr/share/doc/ecwolf
  install -Dm644 README.md docs/README.txt "$pkgdir"/usr/share/doc/ecwolf
  # license
  install -Dm644 docs/license-id.txt "$pkgdir"/usr/share/licenses/ecwolf/license-id.txt
}
