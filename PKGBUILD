# Maintainer: Plailect <plailect@gmail.com>
# Dolphin-Emu-Git Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

pkgbase=dolphin-emu-git-netplay
pkgname=('dolphin-emu-git-netplay' 'dolphin-emu-cli-git-netplay')
pkgver=4.0.2.r7840.ce493b8
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator, v4.0-7840 for Super Smash Bros Netplay'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'portaudio' 'sfml' 'soundtouch' 'xdg-utils' 'wxgtk')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git#commit=ce493b8')
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu

  echo "4.0.2.r$(git rev-list --count 4.0..HEAD).$(git rev-parse --short HEAD)"
}

build() {
  sed -i -e 's/2000, nullptr, nullptr, 0, 0/2000, nullptr, nullptr, 0, 0, 2/g' dolphin-emu/Source/Core/Core/NetPlayServer.cpp

  cd dolphin-emu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_C_FLAGS='-fno-pie' \
    -DCMAKE_CXX_FLAGS='-fno-pie' \
    -DENABLE_LTO='TRUE' \
    -DENABLE_QT2='TRUE' \
    -DENABLE_SDL='TRUE' \
    -DUSE_SHARED_ENET='TRUE'
  make
}

package_dolphin-emu-git-netplay() {
  provides=('dolphin-emu')
  conflicts=('dolphin-emu' 'dolphin-emu-git')

  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/bin/dolphin-emu-{nogui,qt2}
}

package_dolphin-emu-cli-git-netplay() {
  depends=('dolphin-emu-git-netplay')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/dolphin-emu-cli
}
