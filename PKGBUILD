# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
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
conflicts=('fuse-exfat' 'exfat-utils' )
source=(exfat-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz
        nofuse.patch)
sha512sums=('fa3951e16889db65685e1fb71b0c75fc7014a8025c3442bf6164b94ddd51d282a8ae5e891c46195be53d2a10d62444e2fa1bb3fa3de59c2c3411c6dac363b488'
            '0230949d9d8775e88a08adc638f49de30aac53963528db2141f5fea5f41a89f08869bace29e121c99bb7af0ba0bb60b671f437950d26024533abaacb49ec78ae')

prepare() {
  cd exfat-${pkgver}
  # build without fuse support
  patch -p0 < ${srcdir}/nofuse.patch
}

build() {
  cd exfat-${pkgver}
  autoreconf -fiv
  ./configure --prefix=/usr --sbindir=/usr/bin
  make CCFLAGS="${CFLAGS} ${CPPFLAGS} -std=c99" LINKFLAGS="${LDFLAGS}"
}

package() {
  cd exfat-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 */*.8 -t "${pkgdir}"/usr/share/man/man8
}
