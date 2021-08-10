# Maintainer: xeruf <27f at pm dot me>

pkgname=exfat-utils-debug
pkgver=1.3.0
pkgrel=3
pkgdesc='Utilities for the exFAT file system with debugging enabled'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/relan/exfat'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfat-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz"
        debug.patch)
b2sums=('d4d074f94784ab038129a06acdf0c45252898776cc11d4db998f6d914ef47bc80add29e90eeb59b88a98b5828bd77773bb84f47c26e26a1a1a53cd1a3e1c7746'
  'd2338d96012e7e3815b8d87c0addb5bc6d9e6986299b5e601342bcdc8e523be95e495d07538acfa907096eed5fa946c491a74516a90e7406fa3cda7a04ad18db')

prepare() {
  cd exfat-${pkgver}
  patch -p0 < "${srcdir}"/debug.patch
  autoreconf -fiv
}

build() {
  cd exfat-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make CCFLAGS="${CFLAGS} ${CPPFLAGS} -std=c99" LINKFLAGS="${LDFLAGS}"
}

package() {
  cd exfat-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 */*.8 -t "${pkgdir}"/usr/share/man/man8
}
