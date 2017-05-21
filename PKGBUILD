# Maintainer: Hannes Mann <hannesmann2000@gmail.com>
# Based on: https://aur.archlinux.org/dolphin-emu-git.git

pkgbase=dolphin-hau-git
pkgname=('dolphin-hau-git' 'dolphin-hau-cli-git')
pkgver=5.0_hau.1
pkgrel=1
pkgdesc='A Wii/GameCube Emulator (Melee/Project M)'
arch=('x86_64')
url='http://github.com/HannesMann/dolphin-hau'
license=('GPL')
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'openal' 'portaudio' 'soundtouch' 'xdg-utils' 'wxgtk')
makedepends=('cmake' 'git')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-hau::git+https://github.com/HannesMann/dolphin-hau.git')
sha256sums=('SKIP')

prepare() {
  cd dolphin-hau

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd dolphin-hau/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package_dolphin-hau-git() {
  provides=('dolphin-hau')
  conflicts=('dolphin-hau')

  cd dolphin-hau/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/bin/dolphin-hau-{nogui}

  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

package_dolphin-hau-cli-git() {
  depends=('dolphin-hau-git')

  cd dolphin-hau/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-hau-nogui "${pkgdir}"/usr/bin/dolphin-hau-cli
}
