# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=4.05.04
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('x86_64')
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'zlib')
makedepends=('git' 'cmake')
source=("eternity::git+https://github.com/team-eternity/eternity.git#tag=${pkgver}"
        'git+https://github.com/Wohlstand/libADLMIDI.git'
        "0001-Backport-updated-CMake-versions-to-4.05.04.patch")
b2sums=('SKIP'
        'SKIP'
        'f4fd463125387979df36cc42c20e623c89d475be718b7a57e55666e613604088be1f2df89f0b62b8097d81e9698f06816346cbf7ed8b7ac9112b3b48844f4129')

prepare() {
  cd "${srcdir}/eternity"
  git submodule init
  git config submodule.adlmidi.url "${srcdir}/libADLMIDI"
  git -c protocol.file.allow=always submodule update

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  # Cannot do in-tree build.
  mkdir ee-build
  cd ee-build
  cmake ../eternity -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ee-build
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
