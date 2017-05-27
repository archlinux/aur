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
pkgrel=4
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
        "GKYE01.ini"
        "NMNB01.ini"
        "PALE02.ini"
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'be5bc1ed63fc6a030b39786e8dbc7074304a0b82c0333dfe27edb061b7e2dad8'
            '1d8a2553af3581f3a80e36c95d8e01d334015ec7cd3cfc9c19b12e77230567b2'
            'ac0c39f7fe27f1e232523b02347b0645404d40dc0e6ef328d1e37993ab94de0c'
            '6cfb98a6592dbc597b90a7c0562c4179a5f2db5f7ce293e8fad1a0bd19e8c861'
            '858158866197425edcda5b176aa4da289eca8e5422252145c40ea1337c4a1b63'
            '1ad7113b73fe9298a037c020cad63dded4ba842565fb7477e6240cd5d58749e9'
            '11b5a9d907207e9732d9d1b02d99487d0cbed416f033b248baa56c47391d79f6'
            '858158866197425edcda5b176aa4da289eca8e5422252145c40ea1337c4a1b63')
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
