# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgbase=vbam
pkgname=('vbam-sdl' 'vbam-gtk' 'vbam-wx')
pkgver=1.8.0.1292
pkgrel=2
pkgdesc='Nintendo GameBoy Advance emulator'
arch=('i686' 'x86_64')
url='http://vba-m.com'
license=('GPL2')
makedepends=('cmake' 'desktop-file-utils' 'ffmpeg' 'freetype2' 'gtkglextmm'
             'imagemagick' 'glew' 'libjpeg' 'libpng' 'libsndfile' 'libxrandr'
             'openal' 'sfml' 'subversion' 'wxgtk2.8' 'zip')
makedepends_i686=('nasm')
source=("vbam::svn+http://svn.code.sf.net/p/vbam/code/trunk#revision=${pkgver##*.}"
        'vbam-wx-icon.patch')
sha256sums=('SKIP'
            '2c7280ba61359aaaa04edbad4f522aa8b03f3b00a4ab7600b76f60b83a394ea5')

prepare() {
  cd vbam

  patch -Np1 -i ../vbam-wx-icon.patch
  sed 's/wxrc/wxrc-2.8/g' -i {po/update_pot.sh,src/wx/CMakeLists.txt}
  sed 's|Common/|common/|' -i src/gba/debugger-expr-yacc.cpp
}

build() {
  cd vbam

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  _cmakeargs="-DCMAKE_BUILD_TYPE='Release' \
              -DCMAKE_INSTALL_PREFIX='/usr' \
              -DCMAKE_SKIP_RPATH='TRUE' \
              -DENABLE_GTK='TRUE' \
              -DENABLE_WX='TRUE' \
              -DENABLE_FFMPEG='TRUE' \
              -DENABLE_LINK='TRUE' \
              -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
              -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8'"

  if [[ $CARCH == i686 ]]; then
    _cmakeargs="${_cmakeargs} \
                -DENABLE_ASM_CORE='TRUE' \
                -DENABLE_ASM_SCALERS='TRUE'"
  fi

  cmake .. ${_cmakeargs}
  make
}

package_vbam-sdl() {
depends=('sdl' 'sfml')
replaces=('vbam-cli')
backup=('etc/vbam.cfg')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share}
}

package_vbam-gtk() {
depends=('desktop-file-utils' 'gtkglextmm' 'sdl' 'sfml')
conflicts=('vbam-wx')
install='vbam-gtk.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/bin/vbam}
  find "${pkgdir}" -type f -regex .*wxvbam.* -exec rm {} +
}

package_vbam-wx() {
depends=('ffmpeg' 'sfml' 'wxgtk2.8')
conflicts=('vbam-gtk')
options=('!emptydirs')
install='vbam-wx.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,share}/vbam}
  find "${pkgdir}" -type f -regex .*gvbam.* -exec rm {} +
}

# vim: ts=2 sw=2 et:
