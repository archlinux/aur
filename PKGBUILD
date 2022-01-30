# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=nut-multimedia-git
pkgver=r695.12f6a7a
pkgrel=1
pkgdesc="Free multimedia container format. (Git Version)"
arch=('x86_64')
url='https://ffmpeg.org/nut.html'
license=('GPL')
depends=('glibc')
makedepends=('git'
             'doxygen'
              )
conflicts=('nut-multimedia'
           'libnut-git'
           'libnut'
           )
provides=('nut-multimedia'
          'libnut.so'
          'libnut-git'
          'libnut'
          )
source=('git+https://git.ffmpeg.org/nut.git')
sha256sums=('SKIP')

pkgver() {
  cd nut
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  echo "\nLDFLAGS = ${LDFLAGS}" >> nut/src/trunk/config.mak
  sed 's|$(CFLAGS)|& $(LDFLAGS)|g' -i nut/src/trunk/Makefile

  echo "OUTPUT_DIRECTORY = ${pkgdir}/usr/share/doc/nut-multimedia" >>  nut/src/trunk/libnut/Doxyfile
}

build() {
  CFLAGS+=" -fPIC" make -C nut/src/trunk PREFIX=/usr libnut/libnut.so
  make -C nut/src/trunk PREFIX=/usr nututils
}

package() {
  make -C nut/src/trunk PREFIX=/usr DESTDIR="${pkgdir}" install-libnut-shared
  make -C nut/src/trunk PREFIX=/usr DESTDIR="${pkgdir}" install-nututils

  install -Dm644 nut/docs/nut.txt "${pkgdir}/usr/share/doc/nut-multimedia/nut.txt"
  install -Dm644 nut/docs/nut4cc.txt "${pkgdir}/usr/share/doc/nut-multimedia/nut4cc.txt"
  install -Dm644 nut/docs/nutissues.txt "${pkgdir}/usr/share/doc/nut-multimedia/nutissues.txt"
  (cd nut/src/trunk/libnut; doxygen)
}
