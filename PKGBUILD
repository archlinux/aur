# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: scj <scj archlinux us>
pkgname=sfml
pkgver=1.6
pkgrel=1
pkgdesc="A simple, fast, cross-platform and object-oriented multimedia API."
arch=('i686' 'x86_64')
url="http://www.sfml-dev.org"
license=('zlib')
depends=('libsndfile' 'openal' 'glew' 'libjpeg' 'libpng' 'soil' 'zlib' 'freetype2')
makedepends=('xz-utils')
optdepends=('qt: build qt-sample' 'wxgtk: build wxwidgets-sample')
source=(http://downloads.sourceforge.net/${pkgname}/SFML-${pkgver}-sdk-linux-64.tar.gz
        use-system-libs.patch)
md5sums=('7a9b3a1ef6d14cd25090e440ccdbb3a8'
         '97f26f224ac1a443d91046358002385e')
build() {
  cd "${srcdir}/SFML-${pkgver}"
  mkdir -p ${pkgdir}/usr/lib \
           ${pkgdir}/usr/include \
           ${pkgdir}/usr/share/sfml
  msg "Applying patches..."
  #xz -d ../sfml-libjpeg-libpng-update.patch.xz || return 1
  patch -Np0 < ../use-system-libs.patch || return 1

  msg "Building libraries"
  make || return 1

  msg "Installing"
  sed '/export DESTDIR/d' -i src/SFML/Makefile || return 1
  DESTDIR="${pkgdir}/usr" make install || return 1

  # fix the library softlinks
  cd ${pkgdir}/usr/lib
  rm *.so
  for lib in *; do
      ln -s $lib ${lib/.${pkgver}/}
  done

  cd "${srcdir}/SFML-${pkgver}"
  msg "Building samples"

  sed -e '/export LDFLAGS/d' -i samples/Makefile || return 1

  #check optional dependencies
  if [ ! -e "/usr/bin/wx-config" ]; then
    sed -e 's/wxwidgets-sample //' -i samples/Makefile || return 1
  fi 
  if [ ! -e "/usr/include/QtGui" ]; then
    sed -e 's/qt-sample //' -i samples/Makefile || return 1
  fi

  sed -e 's|qt4/||g' -i samples/qt/Makefile || return 1
  sed -e '/#include <iostream>/a\#include <stdlib.h>' -i \
    samples/sockets/Sockets.cpp \
    samples/voip/VoIP.cpp || return 1
  LDFLAGS="-L${pkgdir}/usr/lib" make sfml-samples || return 1
  cp -r samples doc ${pkgdir}/usr/share/sfml

  install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1
  find "${pkgdir}/usr/share/${pkgname}/samples" -name "*.o" -delete

}
# vim:set ts=2 sw=2 et:
