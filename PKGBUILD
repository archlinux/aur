# Maintainer: ThaChillera ThaChillera@protonmail.com
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

# latest version obtained from this API endpoint: https://dolphin-emu.org/update/latest/beta/
pkgbase=dolphin-emu-beta-git
pkgname=('dolphin-emu-beta-git' 'dolphin-emu-beta-nogui-git')
pkgver=5.0.r13178.a34823df61
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator - monhtly beta release'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL')
depends=(
  'alsa-lib' 'bluez-libs' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpng'
  'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'pugixml' 'qt5-base'
  'sfml' 'zlib'
  'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so'
  'libminiupnpc.so' 'libswscale.so' 'libudev.so' 'libusb-1.0.so' 'libxxhash.so'
)
makedepends=('cmake' 'git' 'libglvnd' 'python')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git#commit=a34823df61df65168aa40ef5e82e44defd4a0138')
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu

  git describe | sed 's/-/.r/; s/-g/./'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../dolphin-emu \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DENABLE_QT='TRUE' \
    -DUSE_SHARED_ENET='TRUE' \
    -DXXHASH_FOUND='TRUE'\
    -DDISTRIBUTOR='aur.archlinux.org'
  make
}

package_dolphin-emu-beta-git() {
  provides=('dolphin-emu')
  conflicts=('dolphin-emu')

  make DESTDIR="${pkgdir}" -C build install
  rm "${pkgdir}"/usr/bin/dolphin-emu-nogui
  rm -rf "${pkgdir}"/usr/{include,lib/libdiscord-rpc.a}

  install -Dm 644 dolphin-emu/Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

package_dolphin-emu-beta-nogui-git() {
  depends=('dolphin-emu-beta-git')

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 build/Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/dolphin-emu-cli
}

# vim: ts=2 sw=2 et:
