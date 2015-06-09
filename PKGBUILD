# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=1.3.1.r1297.9fa473a
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=('i686' 'x86_64')
url='http://www.pcsx2.net'
license=('GPL2' 'GPL3' 'LGPL2.1' 'LGPL3')
depends_i686=('glew' 'libaio' 'libjpeg-turbo' 'portaudio' 'sdl' 'soundtouch'
              'wxgtk')
depends_x86_64=('lib32-glew' 'lib32-libaio' 'lib32-libjpeg-turbo'
                'lib32-portaudio' 'lib32-sdl' 'lib32-soundtouch' 'lib32-wxgtk')
makedepends=('cmake' 'git' 'png++')
makedepends_x86_64=('gcc-multilib')
optdepends_i686=('libcanberra: Hide silly warning')
optdepends_x86_64=('lib32-gtk-engines: GTK2 engines support'
                   'lib32-gtk-engine-murrine: Murrine GTK3 engine support'
                   'lib32-gtk-engine-unico: Unico GTK2 engine support'
                   'lib32-libcanberra: Hide silly warning')
provides=('pcsx2')
conflicts=('pcsx2')
options=('!emptydirs')
source=('git+https://github.com/PCSX2/pcsx2.git')
sha256sums=('SKIP')

pkgver() {
  cd pcsx2

  h=`grep -o "VersionHi.*" pcsx2/SysForwardDefs.h | grep -o "[0-9]*"`
  m=`grep -o "VersionMid.*" pcsx2/SysForwardDefs.h | grep -o "[0-9]*"`
  l=`grep -o "VersionLo.*" pcsx2/SysForwardDefs.h | grep -o "[0-9]*"`
  v="$h.$m.$l"

  echo "$v.r$(git rev-list --count v1.2.2..HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd pcsx2

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  if [[ $CARCH == i686 ]]; then
    cmake .. \
      -DCMAKE_BUILD_TYPE='Release' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_LIBRARY_PATH='/usr/lib' \
      -DPLUGIN_DIR='/usr/lib/pcsx2' \
      -DGAMEINDEX_DIR='/usr/share/pcsx2' \
      -DEXTRA_PLUGINS='TRUE' \
      -DREBUILD_SHADER='TRUE' \
      -DGLSL_API='TRUE' \
      -DPACKAGE_MODE='TRUE' \
      -DXDG_STD='TRUE'
  elif [[ $CARCH == x86_64 ]]; then
    cmake .. \
      -DCMAKE_BUILD_TYPE='Release' \
      -DCMAKE_TOOLCHAIN_FILE='cmake/linux-compiler-i386-multilib.cmake' \
      -DCMAKE_INSTALL_PREFIX='/usr' \
      -DCMAKE_LIBRARY_PATH='/usr/lib32' \
      -DPLUGIN_DIR='/usr/lib32/pcsx2' \
      -DGAMEINDEX_DIR='/usr/share/pcsx2' \
      -DEXTRA_PLUGINS='TRUE' \
      -DREBUILD_SHADER='TRUE' \
      -DGLSL_API='TRUE' \
      -DPACKAGE_MODE='TRUE' \
      -DXDG_STD='TRUE'
  fi

  make
}

package() {
  cd pcsx2/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
