# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: scj <scj archlinux us>

pkgname=sfml
pkgver=1.6
pkgrel=2
pkgdesc="A simple, fast, cross-platform and object-oriented multimedia API."
arch=('i686' 'x86_64')
url="http://www.sfml-dev.org"
license=('custom:zlib')
depends=('libxrandr' 'libsndfile' 'openal' 'glew' 'libjpeg' 'libpng' 'soil' 'zlib' 'freetype2')
optdepends=('qt: build qt-sample' 'wxgtk: build wxwidgets-sample')
install=sfml.install
source=(http://downloads.sourceforge.net/${pkgname}/SFML-${pkgver}-sdk-linux-64.tar.gz
        use-system-libs.patch)
md5sums=('7a9b3a1ef6d14cd25090e440ccdbb3a8'
         '97f26f224ac1a443d91046358002385e')

build() {
  cd "${srcdir}/SFML-${pkgver}"

  # apply patch to use system libs in favor of included ones (fixes many problems)
  patch -Np0 < ../use-system-libs.patch

  # compile sfml
  make

  # prepare samples
  sed -e '/export LDFLAGS/d' -i samples/Makefile

  #check optional dependencies
  if [ ! -e "/usr/bin/wx-config" ]; then
    sed -e 's/wxwidgets-sample //' -i samples/Makefile
  fi 
  if [ ! -e "/usr/include/QtGui" ]; then
    sed -e 's/qt-sample //' -i samples/Makefile
  fi

  # fix some samples
  sed -e 's|qt4/||g' -i samples/qt/Makefile
  sed -e '/#include <iostream>/a\#include <stdlib.h>' -i \
    samples/sockets/Sockets.cpp \
    samples/voip/VoIP.cpp

  # fix the library softlinks for samples
  cd lib
  for lib in *; do
      ln -sf $lib ${lib/.${pkgver}/}
  done
  cd ..

  # compile samples
  LDFLAGS="-L${srcdir}/SFML-${pkgver}/lib" make sfml-samples
}

package() {
  cd "${srcdir}/SFML-${pkgver}"

  # prepare some dirs
  mkdir -p ${pkgdir}/usr/lib \
           ${pkgdir}/usr/include \
           ${pkgdir}/usr/share/sfml \
           ${pkgdir}/usr/share/doc \
           ${pkgdir}/opt/SFML

  # install it
  sed '/export DESTDIR/d' -i src/SFML/Makefile
  make DESTDIR="${pkgdir}/usr" install

  # fix the library softlinks - again
  cd ${pkgdir}/usr/lib
  rm *.so
  for lib in *; do
      ln -s $lib ${lib/.${pkgver}/}
  done
  cd "${srcdir}/SFML-${pkgver}"

  # install samples
  cp -r samples ${pkgdir}/opt/SFML/samples

  # install docs
  cp -r doc ${pkgdir}/usr/share/doc/sfml

  # handy symlinks
  cd ${pkgdir}/usr/share/sfml
  ln -s ../../../opt/SFML/samples samples
  ln -s ../doc/sfml docs

  # install license
  install -Dm 644 ${srcdir}/SFML-${pkgver}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # clean up
  find "${pkgdir}/opt/SFML/samples" -name "*.o" -delete
}
# vim:set ts=2 sw=2 et:
