# Maintainer: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>
# The following contributors are from community/devil
# Contributor: Laurent Carlier <lordheavym@gmail.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: TheHoff <forums>

pkgname=devil-ilut-vanilla
# "vanilla" as in doesn't add more --enable or --disable flags than neccesary for ILUT
pkgver=1.8.0
pkgrel=3
pkgdesc="Library for reading several different image formats (includes ILUT & doesn't --{dis,en}able more than that)"
arch=('i686' 'x86_64')
url='http://openil.sourceforge.net/'
makedepends=('cmake')
depends=('libpng' 'libmng' 'jasper' 'lcms' 'openexr')
options=('!docs' '!emptydirs')
license=('GPL')
provides=('devil')
conflicts=('devil')
source=(http://downloads.sourceforge.net/openil/DevIL-$pkgver.tar.gz
        hide-endian-functions.patch
        opengl.patch)
md5sums=('4d8c21aa4822ac86d77e44f8d7c9becd'
         'aea342d8ef0be8542901bf693fbcec72'
         'f426bb5dfada46a02d28bad3b78183b3')

prepare() {
  cd "${srcdir}/DevIL/DevIL"

  patch -p1 -i "${srcdir}/hide-endian-functions.patch"
  patch -p1 -i "${srcdir}/opengl.patch"
}

build() {
  mkdir -p "${srcdir}/DevIL/DevIL/build"
  cd "${srcdir}/DevIL/DevIL/build"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..

  make
}

package() {
  cd "${srcdir}/DevIL/DevIL/build"

  DESTDIR="${pkgdir}" make install
  install -Dm644 ../include/IL/ilut_config.h "${pkgdir}/usr/include/IL/"
}
