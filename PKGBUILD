# Maintainer: Javier Tia <javier.tia@gmail.com>

_pkgbase=fuse
pkgname=lib32-${_pkgbase}
pkgver=2.9.3
pkgrel=2
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program. (32 bit)"
arch=('x86_64')
url="http://fuse.sourceforge.net/"
license=('GPL2')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=(http://downloads.sourceforge.net/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
options=(!libtool)
sha256sums=('0beb83eaf2c5e50730fc553406ef124d77bc02c64854631bdfc86bfd6437391c')

prepare() {
  cd ${_pkgbase}-${pkgver}
  # fix building with glibc-2.14
  sed -i '1i#define _GNU_SOURCE' util/fusermount.c
  sed -i "/MOUNT_FUSE_PATH=/s#/sbin#/usr/bin#" configure
}

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr --enable-lib \
    --enable-util --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/{dev,etc,usr/{bin,include,share}}
}

# vim:set ts=2 sw=2 et:
