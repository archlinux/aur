# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgbase=vbam-svn
pkgname=('vbam-sdl-svn' 'vbam-gtk-svn' 'vbam-wx-svn')
pkgver=2.0.0.r1499
pkgrel=1
pkgdesc='Nintendo GameBoy Advance emulator'
arch=('i686' 'x86_64')
url='http://vba-m.com'
license=('GPL2')
depends=('sdl' 'sfml' 'zip')
makedepends=('cmake' 'desktop-file-utils' 'ffmpeg' 'freetype2' 'imagemagick'
             'glew' 'gtkglextmm' 'libjpeg' 'libpng' 'libsndfile' 'libxrandr'
             'openal' 'subversion' 'wxgtk')
makedepends_i686=('nasm')
options=('!emptydirs')
source=('vbam::svn+http://svn.code.sf.net/p/vbam/code/trunk')
sha256sums=('SKIP')

pkgver() {
  cd vbam

  echo "2.0.0.r$(svnversion | tr -d '[A-z]')"
}

prepare() {
  cd vbam/src

  touch svnrev.h
}

build() {
  cd vbam

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  _cmakeargs="-DCMAKE_BUILD_TYPE='Release' \
              -DCMAKE_INSTALL_PREFIX='/usr' \
              -DCMAKE_CXX_FLAGS='-DSVN_REV_STR'
              -DCMAKE_SKIP_RPATH='TRUE' \
              -DENABLE_GTK='TRUE' \
              -DENABLE_WX='TRUE' \
              -DENABLE_FFMPEG='TRUE' \
              -DENABLE_LINK='TRUE'"

  if [[ $CARCH == i686 ]]; then
    _cmakeargs="${_cmakeargs} \
                -DENABLE_ASM_CORE='TRUE' \
                -DENABLE_ASM_SCALERS='TRUE'"
  fi

  cmake .. ${_cmakeargs}
  make
}

package_vbam-sdl-svn() {
provides=('vbam-sdl')
conflicts=('vbam-sdl')
backup=('etc/vbam.cfg')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share/{applications,icons,locale,man/man1/{g,wx}vbam.1,vbam}}
}

package_vbam-gtk-svn() {
depends+=('desktop-file-utils' 'gtkglextmm')
provides=('vbam-gtk')
conflicts=('vbam-gtk' 'vbam-wx' 'vbam-wx-svn')
install='vbam-gtk.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin/vbam,share/man/man1/vbam.1}}
  find "${pkgdir}" -type f -regex .*wxvbam.* -exec rm {} +
}

package_vbam-wx-svn() {
depends+=('ffmpeg' 'wxgtk')
provides=('vbam-wx')
conflicts=('vbam-gtk' 'vbam-gtk-svn' 'vbam-wx')
install='vbam-wx.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin/vbam,share/man/man1/vbam.1}}
  find "${pkgdir}" -type f -regex .*gvbam.* -exec rm {} +
}

# vim: ts=2 sw=2 et:
