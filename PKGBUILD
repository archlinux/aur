# Maintainer: Llewelyn Tranaearn <WoefulDerelict at GMail dot com>
# Contributor: Daemon Lee Schmidt <DaemonLeeSchmidt at gmail dot com>
# Contributor: Tobias Powalowski <tpowa at archlinux dot org>

pkgname=lib32-pciutils
pkgver=3.5.1
pkgrel=1
pkgdesc="PCI bus configuration space access library (32-bit)"
arch=('x86_64')
url="http://mj.ucw.cz/sw/pciutils/"
license=('GPL2')
depends=("${pkgname#lib32-}" 'lib32-kmod' 'lib32-systemd')
makedepends=('gcc-multilib')
source=("ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci/${pkgname#lib32-}-${pkgver}.tar.gz"
        "ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci/${pkgname#lib32-}-${pkgver}.tar.gz.sign")
sha512sums=('a324e96556db23011cf86a3ef082851a608c1ef6dd3841cd3231c2e9ef20085cadc22fc6517fc86595610a6d45fc9a05663ebd4d8702e6fbb9def91d2f5e5985'
            'SKIP')
validpgpkeys=('5558F9399CD7836850553C6EC28E7847ED70F82D') # Martin Mares <mj@ucw.cz>

build() {
  export LDFLAGS+=' -m32'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}-${pkgver}"
  make CC="gcc -m32" OPT="${CFLAGS} -fPIC -DPIC" ZLIB=no SHARED=no PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 lib/libpci.a
  cp lib/libpci.a "${srcdir}/"
  make clean
  make CC="gcc -m32" OPT="${CFLAGS}" ZLIB=no SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 all
}

package() {
  cd "${pkgname#lib32-}-${pkgver}"
  make CC="gcc -m32" SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 DESTDIR="${pkgdir}" install install-lib
  install -m644 "${srcdir}/libpci.a" "${pkgdir}/usr/lib32/"
  rm -rf "${pkgdir}/usr/"{bin,share,include}
}
