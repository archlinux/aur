# Creator: Dimitris Panokostas <midwan@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=8.2.1
pkgrel=2
pkgdesc="Optimized Amiga emulator"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('curl' 'flac' 'sdl3' 'sdl3_image' 'sdl3_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'enet' 'libpcap' 'tinyxml2' 'nlohmann-json' 'zlib' 'libpng' 'libglvnd')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
source=(${pkgname%}::"git+https://github.com/BlitterStudio/amiberry.git#tag=v$pkgver")
source_aarch64=(https://github.com/BlitterStudio/amiberry-qemu-uae/releases/download/v11.0.1-amiberry.5/qemu-uae-linux-aarch64.tar.xz)
source_x86_64=(https://github.com/BlitterStudio/amiberry-qemu-uae/releases/download/v11.0.1-amiberry.5/qemu-uae-linux-x86_64.tar.xz)
sha256sums=('3deb6f6a379410bf0e787d2d4e582eab9233b12fdcf1361c95287e051b151d3a')
sha256sums_x86_64=('2bad7e620c47d4ef64decd253c021adfb21226f97f1c723a0aa64da7dc7ab94e')
sha256sums_aarch64=('8fcda3cb695456a7e9501d367fb28dec46480ea39d34b3a2074db505a13e8c15')

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
