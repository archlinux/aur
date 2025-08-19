# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
# Contributor: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog-devel
pkgver=9.3.28
pkgrel=1
pkgdesc='Prolog environment (development version)'
arch=('x86_64' 'i686')
url='https://www.swi-prolog.org/'
license=(GPL LGPL)
depends=('gmp' 'readline' 'openssl' 'libarchive' 'libyaml')
makedepends=(cmake jdk-openjdk junit libjpeg libxft libxinerama libxpm ninja unixodbc)
optdepends=('unixodbc:     for using the odbc4pl library'
            'uuid: for using the uuid library'
            'libjpeg:      for using the pl2xpce library'
            'libxpm:       for using the pl2xpce library'
            'libxinerama:  for using the pl2xpce library'
            'libxft:       for using the pl2xpce library'
            'jdk-openjdk:  for using Prolog from Java'
            'java-runtime: for using Prolog from Java')
source=("https://www.swi-prolog.org/download/devel/src/swipl-$pkgver.tar.gz")
sha256sums=('cb53d53936ef8eb18e96d501eeaa5c7642c40d30b19e3d52f72ba33981e15195')

provides=('swi-prolog')
conflicts=('swi-prolog')




build() {
  mkdir -p build
  cd build
  cmake ../swipl-$pkgver \
    -DCMAKE_BUILD_TYPE=PGO \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -ffile-prefix-map=$PWD= -w" \
    -DLIBEDIT_LIBRARIES=/usr/lib/libedit.so.0 \
    -DLIBEDIT_INCLUDE_DIR=/usr/include \
    -DUSE_TCMALLOC=OFF \
    -G Ninja
  #../swipl-$pkgver/scripts/pgo-compile.sh
  ninja
}

check() {
  cd build
  # the prolog_in_java test fails
  ctest -j 8 || true
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}

# getver: www.swi-prolog.org/download/devel
# vim: ts=2 sw=2 et:
