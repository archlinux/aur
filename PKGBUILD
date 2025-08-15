# Maintainer: Tabitha Hanegan <info@tabithahanegan.com>
# Contributor: Dolphin Team <team@dolphin-emu.org>
pkgname=dolphin-mpn
pkgver=edeb50f
pkgrel=1
pkgdesc="A GameCube and Wii emulator optimized for Mario Party Netplay"
arch=('x86_64' 'aarch64')
url="https://github.com/tabithahanegan/Dolphin-MPN"
license=('GPL2')
depends=('alsa-lib' 'bluez-libs' 'enchant' 'ffmpeg' 'fmt' 'hidapi' 'libevdev' 'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'miniupnpc' 'pugixml' 'qt6-base' 'sdl2' 'sfml' 'zlib' 'zstd')
makedepends=('cmake' 'git' 'ninja' 'qt6-tools')
optdepends=('pulseaudio: for PulseAudio backend')
provides=('dolphin-emu')
conflicts=('dolphin-emu')
source=("git+https://github.com/MarioPartyNetplay/Dolphin-MPN.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd Dolphin-MPN
  git submodule update --init --recursive
}

build() {
  cd Dolphin-MPN
  cmake -B build \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_QT=ON \
    -DENABLE_NOGUI=ON \
    -DUSE_SYSTEM_LIBS=OFF \
    -DUSE_SYSTEM_ICONV=ON \
    -DUSE_SYSTEM_BZIP2=ON \
    -DUSE_SYSTEM_CURL=ON \
    -DDISTRIBUTOR="Mario Party Netplay" \
    -G Ninja
  cmake --build build
}

package() {
  cd Dolphin-MPN
  DESTDIR="${pkgdir}" cmake --install build
}
