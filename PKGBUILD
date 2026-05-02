# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=eternity-engine
pkgver=4.05.04
pkgrel=1
pkgdesc="An advanced Doom port with vanilla compatibility"
url="http://eternity.youfailit.net/"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'zlib')
makedepends=('git' 'cmake')
source=("eternity::git+https://github.com/team-eternity/eternity.git#tag=${pkgver}"
        "git+https://github.com/Wohlstand/libADLMIDI.git#commit=99d07d222e84412dc28089464e07cdedab6d4ece"
        "0001-Backport-updated-CMake-versions-to-4.05.04.patch")
b2sums=('d48b1e2f23fbb6aaf4463e86dd528fea9dadc0b5560418b7853f3fec47dea25eb9c661aecacfd730d01dc758096f7bb4681103bd0bf49820525f04c9145a8508'
        'f28ec7224370e458d511581f466b244adf4a5311560cc4feef739836f624f9d53879382a3fdf943ed2240542af111681465c5ae1166f6923a4a00aeb369351c7'
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
