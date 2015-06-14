# Maintainer: Zach Jaggi <feilen1000@gmail.com>

pkgname=dolphin-emu-vr-git
pkgver=4.0.2.r6926.5eb7305
pkgrel=2
pkgdesc='A GameCube / Wii / Triforce emulator, with Oculus Rift VR support'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=('bluez-libs' 'ffmpeg' 'libao' 'lzo' 'miniupnpc' 'polarssl' 'portaudio'
         'sdl2' 'sfml' 'soundtouch' 'wxgtk' 'xdg-utils' 'oculus-rift-sdk>=0.5.0.1')
makedepends=('cmake' 'git')
optdepends=('pulseaudio: PulseAudio backend'
			'oculus-udev: Rules to let users access the Oculus Rift')
provides=('dolphin-emu')
conflicts=('dolphin-emu')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/feilen/dolphin.git#branch=VR-Hydra'
		'dolphin-emu.sh')

sha256sums=('SKIP'
			'SKIP')

pkgver() {
  cd dolphin-emu

  _tag='4.0.2'

  printf "%s.r%s.%s" "${_tag}" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd dolphin-emu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-inline-functions -msse2 -fpermissive' \
	-DENABLE_LTO='true'
  make
}

package() {
  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/bin/dolphin-emu ${pkgdir}/usr/share/dolphin-emu/dolphin-emu
  install -m 755 ${srcdir}/dolphin-emu.sh ${pkgdir}/usr/bin/dolphin-emu
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
