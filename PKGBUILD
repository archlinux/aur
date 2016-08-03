# Maintainer: Plailect <plailect@gmail.com>
# Dolphin-Emu-Git Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

pkgbase=dolphin-emu-git-netplay
pkgname=('dolphin-emu-git-netplay' 'dolphin-emu-cli-git-netplay')
pkgver=5.0.r321.be9416c
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator, v5.0-321 for Super Smash Bros Netplay'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'portaudio' 'sfml' 'soundtouch' 'xdg-utils' 'wxgtk')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git#commit=be9416c')
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu

  git describe | sed 's/-/.r/; s/-g/./'
}

prepare() {
  cd dolphin-emu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd dolphin-emu/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-pie' \
    -DENABLE_LTO='TRUE' \
    -DENABLE_QT2='TRUE' \
    -DUSE_SHARED_ENET='TRUE' \
    -DDISTRIBUTOR='aur.archlinux.org'
  make
}

package_dolphin-emu-git-netplay() {
  provides=('dolphin-emu')
  conflicts=('dolphin-emu' 'dolphin-emu-git')

  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/bin/dolphin-emu-{nogui,qt2}

  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

package_dolphin-emu-cli-git-netplay() {
  depends=('dolphin-emu-git-netplay')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/dolphin-emu-cli
}

package_dolphin-emu-qt-git-netplay() {
  depends=('dolphin-emu-git-netplay' 'qt5-base')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-emu-qt2 "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
