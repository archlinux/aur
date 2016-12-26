# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

pkgname=dolphin-emu-faster-melee
# shellcheck disable=SC2034
pkgver=4.3
# shellcheck disable=SC2034
pkgrel=5
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
source=("${pkgname}::git+https://github.com/Tinob/Ishiiruka.git#commit=0b00f1f6267190a8bf9a3584497a35d8762eb0a9"
        "GALE01r2.ini"
        "GALE01.ini"
        "MNCE02.ini"
        "NMNB01.ini"
        "PALE02.ini"
       )
# shellcheck disable=SC2034
sha256sums=('SKIP'
            'eae12be9d008453d09bf1379315a2299eca9c76cc093727f8f41926193981c50'
            'a930e0490bfa95f66f96919d320e04f99d6988587209700a536bf7549d53466a'
            '4dd62a40be7a41c92079c9ee23f5fd458c85f275431881c707450f634fdcf24c'
            '4dd62a40be7a41c92079c9ee23f5fd458c85f275431881c707450f634fdcf24c'
            '4dd62a40be7a41c92079c9ee23f5fd458c85f275431881c707450f634fdcf24c')
# shellcheck disable=SC2034
provides=('dolphin-emu')
# shellcheck disable=SC2034
conflicts=('dolphin-emu' 'dolphin-emu-git')

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

  install -Dm 644 ../Data/51-usb-device.rules -t "${pkgdir}"/usr/lib/udev/rules.d/

  # Patch Gecko Codes
  cp -f "${srcdir}/GALE01r2.ini" "${pkgdir}"/usr/share/dolphin-emu/sys/GameSettings/GALE01r2.ini
}

# vim: ts=2 sw=2 et:
