# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgbase=vbam
pkgname=('vbam-sdl' 'vbam-gtk' 'vbam-wx')
pkgver=2.0.0b1
pkgrel=3
pkgdesc='Nintendo GameBoy Advance emulator'
arch=('i686' 'x86_64')
url='http://vba-m.com'
license=('GPL2')
depends=('sdl' 'sfml' 'zip')
makedepends=('cmake' 'desktop-file-utils' 'freetype2' 'imagemagick' 'glew'
             'gtkglextmm' 'libjpeg' 'libpng' 'libsndfile' 'libxrandr'
             'openal' 'subversion' 'wxgtk')
makedepends_i686=('nasm')
options=('!emptydirs')
source=("vbam::svn+http://svn.code.sf.net/p/vbam/code/trunk#revision=1465"
        'cxx11-fixes.patch')
sha256sums=('SKIP'
            '610d770bfcea8da990cddc33c6360b572bc20683b216ab1e6f23424e9d494417')

prepare() {
  cd vbam
  patch -Np1 -i ../cxx11-fixes.patch
  mkdir build
}

build() {
  cd vbam/build

  _cmakeargs="-DCMAKE_BUILD_TYPE='Release' \
              -DCMAKE_INSTALL_PREFIX='/usr' \
              -DCMAKE_SKIP_RPATH='TRUE' \
              -DENABLE_GTK='TRUE' \
              -DENABLE_WX='TRUE' \
              -DENABLE_FFMPEG='FALSE' \
              -DENABLE_LINK='TRUE'"

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
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share/{applications,icons,locale,man/man1/{g,wx}vbam.1,vbam}}
}

package_vbam-gtk() {
depends+=('desktop-file-utils' 'gtkglextmm')
conflicts=('vbam-wx')
install='vbam-gtk.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin/vbam,share/man/man1/vbam.1}}
  find "${pkgdir}" -type f -regex .*wxvbam.* -exec rm {} +
}

package_vbam-wx() {
depends+=('wxgtk')
conflicts=('vbam-gtk')
install='vbam-wx.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin/vbam,share/man/man1/vbam.1}}
  find "${pkgdir}" -type f -regex .*gvbam.* -exec rm {} +
}

# vim: ts=2 sw=2 et:
