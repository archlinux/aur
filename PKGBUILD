# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jeremy Newton (Mystro256) <alexjnewt@gmail.com>

pkgname=dolphin-emu-gtk2
pkgver=5.0
pkgrel=1
pkgdesc='A Gamecube / Wii / Triforce emulator (GTK2 version)'
arch=('x86_64')
url='http://dolphin-emu.org'
license=('GPL')

makedepends=('cmake')
depends=('bluez-libs' 'curl' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'openal' 'portaudio' 'soundtouch' 'xdg-utils' 'wxgtk')
optdepends=('pulseaudio: PulseAudio backend')
provides=('dolphin-emu')
conflicts=('dolphin-emu')
options=('!emptydirs')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dolphin-emu/dolphin/archive/${pkgver}.tar.gz")
sha256sums=('62c4602055767ab314ff50a3b94ea57f792832aa1629e6b1117ebce10518dc0b')

prepare() {
  cd dolphin-${pkgver}

  # Fix build
  sed -i 's/CHAR_/CHARACTER_/g' Source/Core/VideoBackends/OGL/RasterFont.cpp
}

build() {
  cd dolphin-${pkgver}

  mkdir build && cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-pie' \
    -DENABLE_LTO='TRUE' \
    -DUSE_SHARED_ENET='TRUE'
  make
}

package() {
  cd dolphin-${pkgver}/build

  make DESTDIR="${pkgdir}" install

  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et:
