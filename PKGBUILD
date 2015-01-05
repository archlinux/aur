# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgbase=vbam
pkgname=('vbam-cli' 'vbam-gtk' 'vbam-wx')
pkgver=1.8.0.1229
pkgrel=1
arch=('i686' 'x86_64')
url='http://vba-m.com'
license=('GPL2')
makedepends=('cmake' 'desktop-file-utils' 'ffmpeg' 'freetype2' 'gtkglextmm'
             'imagemagick' 'glew' 'libjpeg' 'libpng' 'libsndfile' 'libxrandr'
             'openal' 'subversion' 'wxgtk2.8' 'zip')
[[ $CARCH == i686 ]] && makedepends+=('nasm')
source=("vbam::svn+http://svn.code.sf.net/p/vbam/code/trunk#revision=${pkgver##*.}"
        'http://www.sfml-dev.org/files/SFML-1.6-sdk-linux-64.tar.gz'
        'http://www.lonesock.net/files/soil.zip'
        'sfml.patch'
        'soil.patch'
        'vbam-util.patch'
        'vbam-ffmpeg2.patch')
sha256sums=('SKIP'
            '05bdc32286ab2ec8cb1ccdafe53f31830284e09e11ebfc3ab3836c99a0d9654b'
            'a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701'
            'c3c2fc48f4edc303ad24d91583a57aef9b7ca3b78de1d6734cb666745fff9bad'
            '65705aeef90667bd4e28dd03ac0b43685470f2925b642637b7ff6e2f3acd34c7'
            '54515cd8207cc110940c748c9bef801cb160a51071fdedcbea681d9af04bd09e'
            '91c468480ba5bfbe208a50dc6118a6229aabd3e9c7d41b0d59454b25014343b0')

prepare() {
  patch -Np0 -i soil.patch
  patch -Np0 -i sfml.patch

  cd vbam

  patch -Np1 -i ../vbam-util.patch
  patch -Np1 -i ../vbam-ffmpeg2.patch
  sed 's/wxrc/wxrc-2.8/g' -i {po/update_pot.sh,src/wx/CMakeLists.txt}
}

build() {
# Build static SOIL
  pushd 'Simple OpenGL Image Library/src'
  make -f "../projects/makefile/alternate Makefile.txt"
  make -f "../projects/makefile/alternate Makefile.txt" DESTDIR="${srcdir}/staging" install
  popd

# Build static SFML
  pushd SFML-1.6
  make
  make DESTDIR="${srcdir}/staging/usr" install
  popd

# Build VBA-M
  cd vbam

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  local _cmakeargs="-DCMAKE_BUILD_TYPE='Release' \
                    -DCMAKE_CXX_FLAGS=-I${srcdir}/staging/usr/include \
                    -DCMAKE_INSTALL_PREFIX='/usr' \
                    -DCMAKE_SKIP_RPATH='TRUE' \
                    -DENABLE_GTK='TRUE' -DENABLE_WX='TRUE' \
                    -DENABLE_FFMPEG='TRUE' -DENABLE_LINK='TRUE' \
                    -DSFML_INCLUDE_DIR='../../staging/usr/include/SFML' \
                    -DSFML_AUDIO_INCLUDE_DIR='../../staging/usr/include/SFML/Audio' \
                    -DSFML_AUDIO_LIBRARY='../../staging/usr/lib/libsfml-audio-s.a' \
                    -DSFML_GRAPHICS_INCLUDE_DIR='../../staging/usr/include/SFML/Graphics' \
                    -DSFML_GRAPHICS_LIBRARY='../../staging/usr/lib/libsfml-graphics-s.a' \
                    -DSFML_NETWORK_INCLUDE_DIR='../../staging/usr/include/SFML/Network' \
                    -DSFML_NETWORK_LIBRARY='../../staging/usr/lib/libsfml-network-s.a' \
                    -DSFML_SYSTEM_INCLUDE_DIR='../../staging/usr/include/SFML/System' \
                    -DSFML_SYSTEM_LIBRARY='../../staging/usr/lib/libsfml-system-s.a' \
                    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
                    -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8'"

  if [[ $CARCH == i686 ]]; then
    cmake .. ${_cmakeargs} -DENABLE_ASM_{CORE,SCALERS}='TRUE'
  else
    cmake .. ${_cmakeargs}
  fi
  make
}

package_vbam-cli() {
pkgdesc='Nintendo GameBoy Advance emulator'
depends=('libgl' 'libpng' 'sdl')
backup=('etc/vbam.cfg')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share}
}

package_vbam-gtk() {
pkgdesc='Nintendo GameBoy Advance emulator'
depends=('desktop-file-utils' 'gtkglextmm' 'sdl')
conflicts=('vbam-wx')
install='vbam-gtk.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/bin/vbam}
  find "${pkgdir}" -type f -regex .*wxvbam.* -exec rm {} +
}

package_vbam-wx() {
pkgdesc='Nintendo GameBoy Advance emulator'
depends=('ffmpeg' 'wxgtk2.8')
conflicts=('vbam-gtk')
options=('!emptydirs')
install='vbam-wx.install'

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,share}/vbam}
  find "${pkgdir}" -type f -regex .*gvbam.* -exec rm {} +
}

# vim: ts=2 sw=2 et:
