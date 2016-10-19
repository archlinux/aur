# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

pkgname=dolphin-emu-faster-melee
# shellcheck disable=SC2034
pkgver=4.3
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
pkgdesc='The FasterMelee build of the Dolphin Emulator'
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
url='http://fastermelee.net'
# shellcheck disable=SC2034
license=('GPL')

# shellcheck disable=SC2034
makedepends=('cmake')

# shellcheck disable=SC2034
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'openal' 'portaudio' 'soundtouch' 'xdg-utils' 'wxgtk')
# shellcheck disable=SC2034
optdepends=('pulseaudio: PulseAudio backend')

# shellcheck disable=SC2034
options=('!emptydirs')

# The commit for FasterMelee 4.3
# shellcheck disable=SC2034
source=("${pkgname}::git+https://github.com/Tinob/Ishiiruka.git#commit=0b00f1f6267190a8bf9a3584497a35d8762eb0a9")

# shellcheck disable=SC2034
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}" || {
        msg "Failed to cd into ${srcdir}/${pkgname}"
        return 1
  }

  mkdir build
  cd build || {
        msg "Failed to cd into ${srcdir}/${pkgname}/build"
        return 1
  }

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-pie' \
    -DENABLE_LTO='TRUE' \
    -DUSE_SHARED_ENET='TRUE' \
    -DDISTRIBUTOR='pyamsoft'
  make
}

package() {
  cd "${srcdir}/${pkgname}" || {
        msg "Failed to cd into ${srcdir}/${pkgname}"
        return 1
  }

  cd build || {
        msg "Failed to cd into ${srcdir}/${pkgname}/build"
        return 1
  }

  make DESTDIR="${pkgdir}" install

  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/
}

# vim: ts=2 sw=2 et:
