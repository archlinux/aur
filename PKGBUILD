# Creator: Dimitris Panokostas <midwan@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=8.3.0
pkgrel=1
pkgdesc="Optimized Amiga emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('curl' 'flac' 'sdl3' 'sdl3_image' 'sdl3_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'enet' 'libpcap' 'tinyxml2' 'nlohmann-json' 'zlib' 'libpng' 'libglvnd')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
_qemu_ver=11.0.1-amiberry.7
source=("${pkgname}::git+https://github.com/BlitterStudio/amiberry.git#tag=v$pkgver")
source_aarch64=("qemu-uae-linux-aarch64-${_qemu_ver}.tar.xz::https://github.com/BlitterStudio/amiberry-qemu-uae/releases/download/v${_qemu_ver}/qemu-uae-linux-aarch64.tar.xz")
source_x86_64=("qemu-uae-linux-x86_64-${_qemu_ver}.tar.xz::https://github.com/BlitterStudio/amiberry-qemu-uae/releases/download/v${_qemu_ver}/qemu-uae-linux-x86_64.tar.xz")
sha256sums=('fe57e685037a7caa7fc6c30f92e71980642a3ae9ea8d41ff9514f8f6ca6353eb')
sha256sums_x86_64=('62926ba5437d21e6daeea841bc103088c2f5849206681eb47e6d2bcabc9c8f52')
sha256sums_aarch64=('6906cfc09c2478313c1eaddc941bc670db3d8bda63f418c69773415ebe429c8f')

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive
}

build() {
  cd ${pkgname}
  cmake \
  -B build \
  -DCMAKE_BUILD_TYPE=None \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname}/build
  install -Dm644 "${srcdir}/qemu-uae.so" "${pkgdir}/usr/lib/amiberry/qemu-uae.so"
}
