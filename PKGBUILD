# Maintainer: Llewelyn Tranaearn <WoefulDerelict at GMail dot com>
# Contributor: Daemon Lee Schmidt <DaemonLeeSchmidt at gmail dot com>
# Contributor: Tobias Powalowski <tpowa at archlinux dot org>

pkgname=lib32-pciutils
pkgver=3.13.0
pkgrel=1
pkgdesc="PCI bus configuration space access library (32-bit)"
arch=('x86_64')
url="https://mj.ucw.cz/sw/pciutils/"
license=('GPL2')
depends=("${pkgname#lib32-}" 'lib32-kmod' 'lib32-systemd')
makedepends=('git' 'lib32-gcc-libs')
source=(https://mj.ucw.cz/download/linux/pci/${pkgname#lib32-}-${pkgver}.tar.gz{,.sign})
sha512sums=('73f99b5c2251676368738e0dc9d82529f3516966f1658a96149768b9775a0e177d630512dc7ea33087a7fcb960a3498f0c4c1a9f7233ec1cf242b9ab087fa0d1'
            'SKIP')
validpgpkeys=('C466A56CADA981F4297D20C31F3D0761D9B65F0B') # Martin Mares <mj@ucw.cz>

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}-${pkgver}"
  make OPT="${CFLAGS}" ZLIB=no SHARED=no PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 lib/libpci.a
  cp lib/libpci.a "${srcdir}/"
  make clean
  make OPT="${CFLAGS}" ZLIB=no SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 all
}

package() {
  cd "${pkgname#lib32-}-${pkgver}"
  make SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 DESTDIR="${pkgdir}" install install-lib
  install -m644 "${srcdir}/libpci.a" "${pkgdir}/usr/lib32/"
  rm -rf "${pkgdir}/usr/"{bin,share,include}
}
