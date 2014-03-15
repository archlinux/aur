# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>
pkgname='lib32-eudev-git'
pkgdesc="The userspace dev tools (udev) forked by Gentoo (32-bit)"
pkgver=20140315
pkgrel=1
_udevver=210
arch=('x86_64')
url="https://github.com/gentoo/eudev"
license=('GPL')
depends=('lib32-glib2' 'eudev-git')
makedepends=('git' 'gcc-multilib' 'lib32-util-linux' 'gobject-introspection' 'gperf')
provides=("lib32-systemd=${_udevver}")
replaces=('lib32-systemd')
conflicts=('lib32-systemd')
options=(!makeflags !libtool)
source=('git://github.com/gentoo/eudev.git')
md5sums=('SKIP')
_gitname="eudev"

pkgver()
{
  cd "${srcdir}/${_gitname}"

  # Date of last commit
  git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

build() {
  cd "${srcdir}/${_gitname}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  if [ -f "Makefile" ];then
    msg2 "Cleaning up..."
    make clean
  fi

  # Temporary workaround for bug #87
  #sed /"#include <linux\/fcntl.h>"/d -i src/*/*.c
  
  msg2 "Configuring sources..."
  ./autogen.sh
  ./configure --prefix=/usr \
              --with-rootprefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib32 \
              --sbindir=/usr/bin \
              --with-firmware-path=/usr/lib/firmware/updates:/lib/firmware/updates:/usr/lib/firmware:/lib/firmware \
              --with-modprobe=/usr/bin/modprobe \
              --enable-gudev \
              --enable-introspection \
              --disable-manpages

  msg2 "Compiling..."
  make
}


package() {
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/{bin,include,lib,share}
}

