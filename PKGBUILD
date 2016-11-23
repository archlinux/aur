# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

pkgname=dolphin-emu-faster-melee
# shellcheck disable=SC2034
pkgver=4.3
# shellcheck disable=SC2034
pkgrel=3
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
source=("${pkgname}::git+https://github.com/Tinob/Ishiiruka.git#commit=0b00f1f6267190a8bf9a3584497a35d8762eb0a9"
        "GALE01.ini"
        "GALE01r2.ini"
       )

# shellcheck disable=SC2034
sha256sums=('SKIP'
            '62abf45f5064fac79aeead6340120be5beb8ad7a64f25fd85c07b45e3756df3f'
            'a2ab0e1b737ff8af5a0ccacc40147d331ba0abe5e19aac019add68e732289605')

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

  msg "Make sure you install the GALE01.ini config file into:"
  msg "${HOME}/.local/share/dolphin-emu/GameSettings/GALE01.ini"
}

# vim: ts=2 sw=2 et:
