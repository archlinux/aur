# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=vbam-git
pkgver=2.1.0.r2.g459a1fbe
pkgrel=1
epoch=1
pkgdesc='Nintendo Game Boy Advance emulator'
arch=('i686' 'x86_64')
url='https://github.com/visualboyadvance-m/visualboyadvance-m'
license=('GPL2')
depends=('wxgtk3' 'sfml' 'ffmpeg' 'zip')
makedepends=('git' 'cmake' 'gettext')
makedepends_i686=('nasm')
conflicts=('vbam-gtk' 'vbam-wx')
provides=('vbam-wx')
options=('!emptydirs')
source=('vbam::git+https://github.com/visualboyadvance-m/visualboyadvance-m.git')
sha256sums=('SKIP')

pkgver() {
  cd vbam
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd vbam

  rm -rf build
  mkdir build
}

build() {
  cd vbam/build

  _cmakeargs=(-DCMAKE_INSTALL_PREFIX='/usr'
              -DCMAKE_SKIP_RPATH='TRUE'
              -DENABLE_FFMPEG='TRUE')

  if [[ "$CARCH" == i686 ]]; then
    _cmakeargs+=(-DENABLE_ASM_CORE='TRUE'
                 -DENABLE_ASM_SCALERS='TRUE')
  fi

  cmake .. "${_cmakeargs[@]}"
  make
}

package() {
  cd vbam/build

  make DESTDIR="$pkgdir"/ install
  install -m 755 visualboyadvance-m "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
