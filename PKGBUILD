# Creator: Dimitris Panokostas <midwan@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=8.2.2
pkgrel=1
pkgdesc="Optimized Amiga emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('curl' 'flac' 'sdl3' 'sdl3_image' 'sdl3_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'enet' 'libpcap' 'tinyxml2' 'nlohmann-json' 'zlib' 'libpng' 'libglvnd')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
source=(${pkgname%}::"git+https://github.com/BlitterStudio/amiberry.git#tag=v$pkgver")
source_aarch64=(qemu-uae-linux-aarch64-6.tar.xz::https://github.com/BlitterStudio/amiberry-qemu-uae/releases/download/v11.0.1-amiberry.6/qemu-uae-linux-aarch64.tar.xz)
source_x86_64=(qemu-uae-linux-x86_64-6.tar.xz::https://github.com/BlitterStudio/amiberry-qemu-uae/releases/download/v11.0.1-amiberry.6/qemu-uae-linux-x86_64.tar.xz)
sha256sums=('73c158e8a7ea69dc8583cfc1093f7bba112d62f57673ac2091c4dff685ab4249')
sha256sums_x86_64=('9256c0a9a10ee6c62009585b9f7da646c04ca83eb4d10e24cf37a5ac0f48f543')
sha256sums_aarch64=('5ed6fadb07203fa09ebcbac1f1553d927f85533ba7d39010259d34e1e6a019b1')

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
