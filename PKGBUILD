# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgbase=vbam
pkgname=('vbam-cli' 'vbam-gtk' 'vbam-wx')
pkgver=1.8.0.1202
pkgrel=2
arch=('i686' 'x86_64')
url="http://vba-m.com"
license=('GPL2')
makedepends=('cmake' 'desktop-file-utils' 'freetype2' 'gtkglextmm' 'imagemagick' 'glew' 'libjpeg' 'libpng' 'libsndfile' 'libxrandr' 'mesa' 'openal' 'wxgtk2.8' 'zip')
[[ $CARCH == i686 ]] && makedepends+=('nasm')
source=("http://downloads.sourceforge.net/project/vbam/vbam-src/vbam-r${pkgver##*.}-src.tar.bz2"
        'http://downloads.sourceforge.net/sfml/SFML-1.6-sdk-linux-64.tar.gz'
        'http://www.lonesock.net/files/soil.zip'
        'sfml.patch'
        'soil.patch')
sha256sums=('148d866c08d7a810be5c845247d212f1d1d07395f2ccdecef10ad81a76072877'
            '05bdc32286ab2ec8cb1ccdafe53f31830284e09e11ebfc3ab3836c99a0d9654b'
            'a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701'
            'c3c2fc48f4edc303ad24d91583a57aef9b7ca3b78de1d6734cb666745fff9bad'
            '65705aeef90667bd4e28dd03ac0b43685470f2925b642637b7ff6e2f3acd34c7')

prepare() {
  patch -Np0 -i soil.patch
  patch -Np0 -i sfml.patch
  sed 's/wxrc/wxrc-2.8/g' -i {po/update_pot.sh,src/wx/CMakeLists.txt}
}

build() {
# Build static SOIL
  pushd "Simple OpenGL Image Library/src"
  make -f "../projects/makefile/alternate Makefile.txt"
  make -f "../projects/makefile/alternate Makefile.txt" DESTDIR="${srcdir}/staging" install
  popd

# Build static SFML
  pushd SFML-1.6
  make
  make DESTDIR="${srcdir}/staging/usr" install
  popd

# Build VBA-M
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  local _cmakeargs="-DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_CXX_FLAGS=-I${srcdir}/staging/usr/include -DENABLE_GTK='ON' -DENABLE_WX='ON' \
                    -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8'
                    -DSFML_INCLUDE_DIR='../staging/usr/include/SFML' \
                    -DSFML_AUDIO_INCLUDE_DIR='../staging/usr/include/SFML/Audio' \
                    -DSFML_AUDIO_LIBRARY='../staging/usr/lib/libsfml-audio-s.a' \
                    -DSFML_GRAPHICS_INCLUDE_DIR='../staging/usr/include/SFML/Graphics' \
                    -DSFML_GRAPHICS_LIBRARY='../staging/usr/lib/libsfml-graphics-s.a' \
                    -DSFML_NETWORK_INCLUDE_DIR='../staging/usr/include/SFML/Network' \
                    -DSFML_NETWORK_LIBRARY='../staging/usr/lib/libsfml-network-s.a' \
                    -DSFML_SYSTEM_INCLUDE_DIR='../staging/usr/include/SFML/System' \
                    -DSFML_SYSTEM_LIBRARY='../staging/usr/lib/libsfml-system-s.a'"

  if [[ $CARCH == i686 ]]; then
    cmake .. ${_cmakeargs} -DENABLE_ASM_{CORE,SCALERS}='ON'
  else
    cmake .. ${_cmakeargs}
  fi
  make
}

package_vbam-cli() {
pkgdesc="Nintendo GameBoy Advance emulator - SDL version"
depends=('mesa' 'libpng' 'sdl')
backup=('etc/vbam.cfg')

  cd build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share}
}

package_vbam-gtk() {
pkgdesc="Nintendo GameBoy Advance emulator - GTK version"
depends=('desktop-file-utils' 'gtkglextmm' 'sdl')
conflicts=('vbam-wx')
install='vbam-gtk.install'

  cd build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/bin/vbam}
  find "${pkgdir}" -type f -regex .*wxvbam.* -exec rm {} +
}

package_vbam-wx() {
pkgdesc="Nintendo GameBoy Advance emulator - wx version"
depends=('wxgtk2.8')
conflicts=('vbam-gtk')
options=('!emptydirs')
install='vbam-wx.install'

  cd build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,share}/vbam}
  find "${pkgdir}" -type f -regex .*gvbam.* -exec rm {} +
}

# vim: ts=2 sw=2 et:
