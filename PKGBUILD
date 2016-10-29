# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=ecwolf-hg
pkgver=1.3.3.r3.f002d4054728
pkgrel=1
pkgdesc='Advanced source port of "Wolfenstein 3D" and "Spear of Destiny" based on Wolf4SDL (development version)'
arch=('i686' 'x86_64')
url="http://maniacsvault.net/ecwolf"
license=('GPL' 'custom: ID')
provides=('ecwolf')
conflicts=('ecwolf')
depends=('sdl_net' 'libvorbis' 'flac' 'opusfile' 'libmikmod' 'fluidsynth' 'libjpeg' 'gtk2')
makedepends=('mercurial' 'cmake')
optdepends=('wolf3d-shareware: Demo version of Wolfenstein 3D')
install=ecwolf.install
source=("hg+https://bitbucket.org/Blzut3/ecwolf"
        "hg+https://bitbucket.org/Blzut3/sdl_mixer-for-ecwolf"
        "ecwolf-datadirs.patch")
sha256sums=('SKIP'
            'SKIP'
            '46d59c0a25e34e32fc73cef60c146103cb3e57bc7c904c048371c3eccb89e183')

pkgver() {
  cd ecwolf
  local _tag=$(hg tags -q | sort -r | grep "^[0-9]\.[0-9]" | head -n1)
  local _commits=$(hg log --template "{node}\n" -r $_tag:tip | wc -l)
  local _hash=$(hg identify -i | sed "s/+//")
  printf "%s.r%s.%s" "$_tag" "$_commits" "$_hash"
}

prepare() {
  # reset build folders
  rm -rf build mixer-build
  mkdir build mixer-build

  # data dir hack (using a patch, so we can see it fail, when the source has changed)
  patch -Np0 < ecwolf-datadirs.patch
}

build() {
  msg2 "Building custom SDL_mixer..."
  cd mixer-build
  cmake ../sdl_mixer-for-ecwolf
  make

  msg2 "Building ecwolf..."
  cd ../build
  # build patch utility, enable gpl licensed opl emulator and force custom SDL2_mixer with dependency libraries
  cmake ../ecwolf -DBUILD_PATCHUTIL=ON -DGPL=ON \
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
  cd ../ecwolf
  # doc
  install -d "$pkgdir"/usr/share/doc/ecwolf-hg
  install -Dm644 README.* "$pkgdir"/usr/share/doc/ecwolf-hg
  # license
  install -Dm644 docs/license-id.txt "$pkgdir"/usr/share/licenses/ecwolf-hg/license-id.txt
}
