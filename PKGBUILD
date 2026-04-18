# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: tee < teeaur at duck dot com >

pkgname=vbam-git
pkgver=2.2.3.r460.gb7db7177
pkgrel=1
epoch=1
pkgdesc='Nintendo Game Boy Advance emulator'
arch=('i686' 'x86_64')
url='https://visualboyadvance-m.org'
license=('GPL-2.0-or-later')
depends=('wxwidgets-gtk3' 'sfml' 'ffmpeg' 'openal' 'libxss' 'sdl3')
makedepends=('git' 'cmake' 'gettext' 'zip')
makedepends_i686=('nasm')
conflicts=('vbam-sdl' 'vbam-wx')
provides=('vbam-sdl' 'vbam-wx')
options=('!emptydirs')
source=('git+https://github.com/visualboyadvance-m/visualboyadvance-m.git')
sha256sums=('SKIP')

pkgver() {
  git -C visualboyadvance-m describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _cmakeargs=(-Bbuild
              -DCMAKE_BUILD_TYPE=Release 
              -DCMAKE_INSTALL_PREFIX=/usr
              -DCMAKE_INSTALL_SYSCONFDIR=/etc
              -DCMAKE_SKIP_RPATH='TRUE'
              -DENABLE_FFMPEG='TRUE'
              -DBUILD_TESTING=OFF
              -Wno-dev)

  if [[ "$CARCH" == i686 ]]; then
    _cmakeargs+=(-DENABLE_ASM_CORE='TRUE'
                 -DENABLE_ASM_SCALERS='TRUE')
  fi

  cmake "${_cmakeargs[@]}" visualboyadvance-m
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm755 build/visualboyadvance-m "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
