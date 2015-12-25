# Maintainer: Javier Tia <javier dot tia at gmail dot com>

_pkgbase=fuse
pkgname=lib32-${_pkgbase}
pkgver=2.9.4
_pkgver=2_9_4
pkgrel=1
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program (32 bit)"
arch=('x86_64')
url="https://github.com/libfuse/libfuse"
license=('GPL2')
depends=('lib32-glibc' "${_pkgbase}")
makedepends=('gcc-multilib')
source=("${url}/releases/download/${_pkgbase}_${_pkgver}/${_pkgbase}-${pkgver}.tar.gz")
options=(!libtool)
sha256sums=('6be9c0bff6af8c677414935f31699ea5a7f8f5f791cfa5205be02ea186b97ce1')

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
