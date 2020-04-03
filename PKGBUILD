# Maintainer: Llewelyn Tranaearn <WoefulDerelict at GMail dot com>
# Contributor: Daemon Lee Schmidt <DaemonLeeSchmidt at gmail dot com>
# Contributor: Tobias Powalowski <tpowa at archlinux dot org>

pkgname=lib32-pciutils
pkgver=3.6.4
pkgrel=1
pkgdesc="PCI bus configuration space access library (32-bit)"
arch=('x86_64')
url="https://mj.ucw.cz/sw/pciutils/"
license=('GPL2')
depends=("${pkgname#lib32-}" 'lib32-kmod' 'lib32-systemd')
makedepends=('gcc-multilib' 'git')
source=(git+https://github.com/pciutils/pciutils.git#tag=v$pkgver?signed)
sha512sums=('SKIP')
validpgpkeys=('5558F9399CD7836850553C6EC28E7847ED70F82D') # Martin Mares <mj@ucw.cz>

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}"
  make OPT="${CFLAGS} -fPIC -DPIC" ZLIB=no SHARED=no PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 lib/libpci.a
  cp lib/libpci.a "${srcdir}/"
  make clean
  make OPT="${CFLAGS}" ZLIB=no SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 all
}

package() {
  cd "${pkgname#lib32-}"
  make SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man LIBDIR=/usr/lib32 DESTDIR="${pkgdir}" install install-lib
  install -m644 "${srcdir}/libpci.a" "${pkgdir}/usr/lib32/"
  rm -rf "${pkgdir}/usr/"{bin,share,include}
}
