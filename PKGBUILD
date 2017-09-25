# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=vbam-git
pkgver=2.303.g997b9757
pkgrel=1
pkgdesc='Nintendo Game Boy Advance emulator'
arch=('i686' 'x86_64')
url='https://github.com/visualboyadvance-m/visualboyadvance-m'
license=('GPL2')
depends=('wxgtk3' 'sfml' 'ffmpeg')
makedepends=('git' 'cmake' 'gettext')
makedepends_i686=('nasm')
conflicts=('vbam-gtk' 'vbam-wx')
provides=('vbam-wx')
options=('!emptydirs')
source=('vbam::git+https://github.com/visualboyadvance-m/visualboyadvance-m.git'
        'gtk3.patch')
sha256sums=('SKIP'
            'c7847c7be27f4251bc7ba06ca6ecb1fe0caffd39a683bc5a471932591d871dcf')

pkgver() {
  cd vbam
  git describe | perl -pe 'tr/-/./; s/^\D+//'
}

prepare() {
  cd vbam

  rm -rf build
  mkdir build

  git apply -3 ../gtk3.patch
}

build() {
  cd vbam/build

  _cmakeargs=(-DCMAKE_INSTALL_PREFIX='/usr'
              -DCMAKE_SKIP_RPATH='TRUE')

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
