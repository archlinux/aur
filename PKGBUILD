# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

pkgbase=dolphin-emu-git
pkgname=('dolphin-emu-git' 'dolphin-emu-cli-git' 'dolphin-emu-qt-git')
pkgver=4.0.2.r7019.35e9ada
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'portaudio' 'sfml' 'soundtouch' 'xdg-utils' 'wxgtk')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git')
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu

  echo "4.0.2.r$(git rev-list --count 4.0..HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd dolphin-emu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-inline-functions -fpermissive' \
    -DENABLE_LTO='TRUE' \
    -DENABLE_QT='TRUE' \
    -DUSE_SHARED_ENET='TRUE'
  make
}

package_dolphin-emu-git() {
  provides=('dolphin-emu')
  conflicts=('dolphin-emu')

  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/bin/dolphin-emu-nogui
}

package_dolphin-emu-cli-git() {
  depends=('dolphin-emu-git')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/dolphin-emu-cli
}

package_dolphin-emu-qt-git() {
  depends=('dolphin-emu-git' 'qt5-base')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-emu-qt "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
