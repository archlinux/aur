# Maintainer: Llewelyn Tranaearn <WoefulDerelict at GMail dot com>
# Contributor: Daemon Lee Schmidt <DaemonLeeSchmidt at gmail dot com>
# Contributor: Tobias Powalowski <tpowa at archlinux dot org>

pkgname=lib32-pciutils
pkgver=3.3.1
pkgrel=4
pkgdesc="PCI bus configuration space access library (32-bit)"
arch=('x86_64')
url="http://mj.ucw.cz/sw/pciutils/"
license=('GPL2')
depends=('lib32-systemd' 'pciutils' 'lib32-kmod')
makedepends=('gcc-multilib')
source=("ftp://ftp.kernel.org/pub/software/utils/pciutils/pciutils-${pkgver}.tar.xz")
sha512sums=('47772dedfa5d5efdd7ddc2970e64903090b32ac1579d63951e30edde5d886807952550fa00e5480f9cf782058a1fa5b2864744ab237031e59a0531197244c468')

build() {
  cd "${srcdir}/pciutils-${pkgver}"
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  make CC="gcc -m32" OPT="${CFLAGS} -fPIC -DPIC" ZLIB=no SHARED=no PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 lib/libpci.a
  cp lib/libpci.a "${srcdir}/"
  make clean
  make CC="gcc -m32" OPT="${CFLAGS}" ZLIB=no SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 all
}

package() {
  cd "${srcdir}/pciutils-${pkgver}"
  make CC="gcc -m32" SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 DESTDIR="${pkgdir}" install install-lib
  install -m644 "${srcdir}/libpci.a" "${pkgdir}/usr/lib32/"
  rm -rf "${pkgdir}/usr/"{bin,share,include}
}
