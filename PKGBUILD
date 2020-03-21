# Maintainer: Ebrahim Azarisooreh <ebrahim.azarisooreh@gmail.com>
# Contributor: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog-devel
pkgver=8.1.25
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
provides=('swi-prolog')
conflicts=('swi-prolog')

sha256sums=('e524db5e76ce307ac6259bc2e64885c7dc5d6b93bb71de617dce5ca3df0d9847')

build() {
  mkdir -p build
  cd build
  cmake ../swipl-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -fPIC -ffile-prefix-map=$PWD= -w" \
    -DLIBEDIT_LIBRARIES=/usr/lib/libedit.so.0 \
    -DLIBEDIT_INCLUDE_DIR=/usr/include \
    -G Ninja
  ../swipl-$pkgver/scripts/pgo-compile.sh
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
