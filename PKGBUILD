# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=binauralplayer
_pkgname=BinauralPlayer
pkgver=1.6.0
pkgrel=2
pkgdesc='Binaural Media Player combines traditional media playback with brainwave audio generation'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/alamahant/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'ninja' 'qt6-tools' 'vulkan-headers')
optdepends=('pulse-native-provider')
provides=('binauralplayer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d4382e2613feeb3685aa458b563958bbc47410caf260ee427eb9dbd24bb7f7cd')

build(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_BUILD_TYPE=Release
  cmake --build build_dir
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}

post_install() {
  # warning notice about possible sound issues when using pure ALSA-based setup:
  echo "--------------------------------------------------------------------------------------------------------"
  echo "Note:" 
  echo "In case you don't use PulseAudio or PipeWire and get a following error: No audio output device available"
  echo "...you can always use a PulseAudio emulation (such as apulse) without ever running a PulseAudio server."
  echo "--------------------------------------------------------------------------------------------------------"
}

post_upgrade() {
    post_install
}
