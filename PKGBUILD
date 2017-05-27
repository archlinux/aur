# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

# Please read the comments in the PKGBUILD if you wish to attempt to use
# multiple versions of the dolphin emulator.
#
# Installing multiple versions alongside each other is not tested too often,
# use at own risk. Please report build issues.

pkgname=dolphin-emu-faster-melee
# shellcheck disable=SC2034
pkgver=5.0.3
# shellcheck disable=SC2034
pkgrel=3
# shellcheck disable=SC2034
pkgdesc='The FasterMelee NetPlay build of the Dolphin Emulator'
# shellcheck disable=SC2034
arch=('x86_64')
# shellcheck disable=SC2034
url='http://fastermelee.net'
# shellcheck disable=SC2034
license=('GPL')
# shellcheck disable=SC2034
install="faster-melee.install"
# shellcheck disable=SC2034
makedepends=('cmake')
# shellcheck disable=SC2034
depends=('bluez-libs' 'enet' 'ffmpeg' 'libao' 'libevdev' 'mbedtls' 'miniupnpc'
         'portaudio' 'sfml' 'soundtouch' 'xdg-utils' 'wxgtk')
# shellcheck disable=SC2034
optdepends=('pulseaudio: PulseAudio backend')
# shellcheck disable=SC2034
options=('!emptydirs')
# The commit for FasterMelee 4.3 (unchanged for FasterMelee 4.4)
# shellcheck disable=SC2034
source=("${pkgname}::git+https://github.com/Tinob/Ishiiruka.git#commit=d462ca38724db65d7f92f3edbd16b6657291e420"
        "GALE01r0.ini"
        "GALE01r1.ini"
        "GALE01r2.ini"
        "GALE01.ini"
        "MNCE02.ini"
        "NMNB01.ini"
        "PALE02.ini"
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            '2406936466089ea70ce006a5a631d614c88fa2819f22b6ecd1f5161e1798a3d9'
            '8fcac6f1a0f6e0c590fc229fe86a0c26d0621c355e153979a73ed24afb0a22da'
            'ed28a19527eaf11af94ed02709bf771a965569244259a9cee86d4f3e82fc5048'
            '62abf45f5064fac79aeead6340120be5beb8ad7a64f25fd85c07b45e3756df3f'
            '4dd62a40be7a41c92079c9ee23f5fd458c85f275431881c707450f634fdcf24c'
            '4dd62a40be7a41c92079c9ee23f5fd458c85f275431881c707450f634fdcf24c'
            '4dd62a40be7a41c92079c9ee23f5fd458c85f275431881c707450f634fdcf24c')
# shellcheck disable=SC2034
provides=('dolphin-emu')

# Pulled directly from github.com/ccl2of4
# Thank you
prepare() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${pkgname}" || {
        msg "Failed to cd into ${srcdir}/${pkgname}"
        return 1
   }
}

build() {
  # shellcheck disable=SC2154
  cd "${srcdir}/${pkgname}" || {
        msg "Failed to cd into ${srcdir}/${pkgname}"
        return 1
  }

  mkdir build
  cd build || {
        msg "Failed to cd into ${srcdir}/${pkgname}/build"
        return 1
  }

  # To install multiple versions of the Dolphin emulator, use
  #
  #  -DCMAKE_INSTALL_PREFIX='/opt/dolphin-emu-faster-melee'
  #
  # instead of
  #
  #  -DCMAKE_INSTALL_PREFIX='/usr'
  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-pie' \
    -DENABLE_LTO='TRUE' \
    -DUSE_SHARED_ENET='TRUE' \
    -DDISTRIBUTOR='aur.archlinux.org'
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

  # shellcheck disable=SC2154
  make DESTDIR="${pkgdir}" install

  # To install multiple versions of the Dolphin emulator,
  # install the repository dolphin-emu first as it includes this file.
  # Then comment out this line.
  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/

  # Patch Gecko Codes
  #
  # To install multiple versions of the Dolphin emulator, use
  #
  # cp -f "${srcdir}/GALE01r2.ini" "${pkgdir}"/opt/dolphin-emu-faster-melee/dolphin-emu/sys/GameSettings/GALE01r2.ini
  #
  # Instead of the line below
  cp -f "${srcdir}/GALE01r0.ini" "${pkgdir}"/usr/share/dolphin-emu/sys/GameSettings/GALE01r0.ini
  cp -f "${srcdir}/GALE01r1.ini" "${pkgdir}"/usr/share/dolphin-emu/sys/GameSettings/GALE01r1.ini
  cp -f "${srcdir}/GALE01r2.ini" "${pkgdir}"/usr/share/dolphin-emu/sys/GameSettings/GALE01r2.ini
}

# vim: ts=2 sw=2 et:
