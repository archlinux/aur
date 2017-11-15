# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgbase=vbam
pkgname=('vbam-sdl' 'vbam-gtk' 'vbam-wx')
pkgver=2.0.0b2
pkgrel=3
pkgdesc='Nintendo GameBoy Advance emulator'
arch=('x86_64')
url='http://vba-m.com'
license=('GPL2')
depends=('sdl2' 'sfml' 'zip')
makedepends=('cmake' 'desktop-file-utils' 'freetype2' 'git' 'glew' 'gtkglextmm'
             'imagemagick' 'libjpeg' 'libpng' 'libsndfile' 'libxrandr'
             'openal' 'subversion' 'wxgtk3')
makedepends_i686=('nasm')
options=('!emptydirs')
_commit='1eb768578bc0c4fa17396f573a4b37a652f12acd'
source=("vbam::git+https://github.com/visualboyadvance-m/visualboyadvance-m.git#commit=${_commit}"
        'vbam-fixes.patch')
sha256sums=('SKIP'
            'be860c010e1185c1fa3938f57fd824b9e8e8430a00f851ff21a033de7bce5cf8')

prepare() {
  cd vbam

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build

  patch -Np1 -i ../vbam-fixes.patch
}

build() {
  cd vbam/build

  _cmakeargs="-DCMAKE_BUILD_TYPE='Release' \
              -DCMAKE_INSTALL_PREFIX='/usr' \
              -DCMAKE_SKIP_RPATH='TRUE' \
              -DENABLE_GTK='TRUE' \
              -DENABLE_WX='TRUE' \
              -DENABLE_FFMPEG='FALSE' \
              -DENABLE_LINK='TRUE' \
              -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3"

  if [[ $CARCH == i686 ]]; then
    _cmakeargs="${_cmakeargs} \
                -DENABLE_ASM_CORE='TRUE' \
                -DENABLE_ASM_SCALERS='TRUE'"
  fi

  CXXFLAGS+=' -std=c++11 -fpermissive'

  cmake .. ${_cmakeargs}
  make
}

package_vbam-sdl() {
replaces=('vbam-cli')
backup=('etc/vbam.cfg')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/{usr/etc,}
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share/{applications,icons,locale,man/man1/{g,wx}vbam.1,vbam}}
}

package_vbam-gtk() {
depends+=('gtkglextmm')
conflicts=('vbam-wx')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin/vbam,etc,share/man/man1/vbam.1}}
  find "${pkgdir}" -type f -regex .*wxvbam.* -exec rm {} +
}

package_vbam-wx() {
depends+=('wxgtk3')
conflicts=('vbam-gtk')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  install -m 755 visualboyadvance-m "${pkgdir}"/usr/bin/
  rm -rf "${pkgdir}"/{etc,usr/{bin/vbam,etc,share/man/man1/vbam.1}}
  find "${pkgdir}" -type f -regex .*gvbam.* -exec rm {} +
}

# vim: ts=2 sw=2 et:
