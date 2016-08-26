# Maintainer: trya <tryagainprod@gmail.com>

pkgname=mupen64plus-extraplugins
pkgver=2.0
pkgrel=3
pkgdesc="Additional plugins for Mupen64Plus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/mupen64plus"
license=('GPL')
depends=('glew' 'mesa' "mupen64plus>=$pkgver")
options=(!strip)
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/mupen64plus/mupen64plus-extraplugins-src-2.0.0.tar.gz")
md5sums=('7716f17a3988e95ffcec27f0c05810c0')

prepare() {
  # patch GLEW headers inclusion
  cd "$srcdir/mupen64plus-video-z64/src"
  sed -i rgl.h \
      -i glshader.cpp \
      -e 's|#include <glew.h>|#include <GL/glew.h>|'

  # patch min/max macros
  cd "$srcdir/mupen64plus-video-glide64/src"
  sed -i *.cpp *.h \
      -e 's|min[[:blank:]]*(|glide_min(|g' \
      -e 's|max[[:blank:]]*(|glide_max(|g'
}

build() {
  cd "$srcdir"
  for _plugdir in mupen64plus-rsp* mupen64plus-video*; do
    cd $_plugdir
    make -C projects/unix PREFIX=/usr all
    cd ..
  done
}

package() {
  cd "$srcdir"
  for _plugdir in mupen64plus-rsp* mupen64plus-video*; do
    cd $_plugdir
    make -C projects/unix PREFIX=/usr DESTDIR="$pkgdir" install
    cd ..
  done
}
