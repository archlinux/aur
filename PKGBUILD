# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: rtfreedman  <rob<d_t>til<d_t>freedman<a@T>g*a*l<d_t>com>

pkgname=exfat-utils-nofuse
pkgver=1.3.0
pkgrel=3
pkgdesc='Utilities for the exFAT file system without fuse (to prefer exfat kernel module over fuse)'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/relan/exfat'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfat-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz"
        nofuse.patch)
b2sums=('d4d074f94784ab038129a06acdf0c45252898776cc11d4db998f6d914ef47bc80add29e90eeb59b88a98b5828bd77773bb84f47c26e26a1a1a53cd1a3e1c7746'
        '6dbd6243fa3e790cd40435b1e1d149071f5b2afb7c75bdb36e96b1b6ccdd1186c3b80a4d962e899d9a402c6b9a5e9f8f26e9534a45c1df06fdf04dda858bc625')

prepare() {
  cd exfat-${pkgver}
  # build without fuse support
  patch -p0 < "${srcdir}"/nofuse.patch
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
