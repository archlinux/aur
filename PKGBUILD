pkgbase=dolphin-emu-ishiiruka-git
pkgname=('dolphin-emu-ishiiruka-git' 'dolphin-emu-ishiiruka-cli-git') #Disabled because https://github.com/Tinob/Ishiiruka/issues/97 'dolphin-emu-ishiiruka-qt-git')
pkgver=r12092.02dfa48c7
pkgrel=2
pkgdesc='A GameCube / Wii / Triforce emulator'
arch=('x86_64')
url='https://forums.dolphin-emu.org/Thread-unofficial-ishiiruka-dolphin-custom-version'
license=('GPL')
depends=('alsa-lib' 'bluez-libs' 'cairo' 'enet' 'gcc-libs' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk2' 'hidapi' 'libevdev' 'libgl' 'libpng' 'libpulse'
         'libsm' 'libx11' 'libxi' 'libxrandr' 'libxxf86vm' 'lzo' 'mbedtls'
         'miniupnpc' 'pango' 'sfml' 'zlib'
         'libavcodec.so' 'libavformat.so' 'libavutil.so' 'libcurl.so'
         'libswscale.so' 'libudev.so' 'libusb-1.0.so')
makedepends=('cmake' 'git' 'qt5-base')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/Tinob/Ishiiruka.git')
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
    -DUSE_SHARED_ENET='TRUE' \
    -DDISTRIBUTOR='aur.archlinux.org'
  make
}

package_dolphin-emu-ishiiruka-git() {
  provides=('dolphin-emu-ishiiruka')

  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/bin/ishiiruka-{nogui,qt2}

  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/52-usb-device.rules
}

package_dolphin-emu-ishiiruka-cli-git() {
  depends=('dolphin-emu-ishiiruka-git')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/ishiiruka-nogui "${pkgdir}"/usr/bin/ishiiruka-cli
}

# Disabled because of https://github.com/Tinob/Ishiiruka/issues/97
# package_dolphin-emu-ishiiruka-qt-git() {
  # depends=('dolphin-emu-ishiiruka-git' 'qt5-base')
# 
  # cd dolphin-emu/build
# 
  # install -dm 755 "${pkgdir}"/usr/bin
  # install -m 755 Binaries/dolphin-emu-qt2 "${pkgdir}"/usr/bin/
# }
