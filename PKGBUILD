# Maintainer: Zachary Jaggi <feilen1000@gmail.com>

pkgbase=dolphin-emu-osvr-git
pkgname=('dolphin-emu-osvr-git' 'dolphin-emu-osvr-cli-git')
pkgver=4.0.2.r8742.5b7c294
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator, with OSVR cross-HMD support'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=('bluez-libs' 'ffmpeg' 'libao' 'mbedtls' 'miniupnpc' 'portaudio'
         'sdl2' 'sfml' 'soundtouch' 'xdg-utils' 'wxgtk' 'osvr-core-git' 'osvr-libfunctionality-git')
makedepends=('cmake' 'git')
optdepends=('pulseaudio: PulseAudio backend')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/feilen/dolphin.git#branch=osvr')
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu

  tag='4.0.2'

  echo "${tag}.r$(git rev-list --count ${tag}..HEAD).$(git rev-parse --short HEAD)"
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
    -DENABLE_LTO='TRUE'
  make
}

package_dolphin-emu-osvr-git() {
  provides=('dolphin-emu')
  conflicts=('dolphin-emu')

  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/bin/dolphin-emu-nogui
}

package_dolphin-emu-osvr-cli-git() {
  depends=('dolphin-emu-osvr-git')

  cd dolphin-emu/build

  install -dm 755 "${pkgdir}"/usr/bin
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/dolphin-emu-cli
}

# vim: ts=2 sw=2 et:
