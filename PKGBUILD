# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: rtfreedman  <rob<d_t>til<d_t>freedman<a@T>g*a*l<d_t>com>

pkgname=exfat-utils-nofuse
pkgver=1.4.0
pkgrel=1
pkgdesc='Utilities for the exFAT file system without fuse (to prefer exfat kernel module over fuse)'
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/relan/exfat'
license=('GPL2')
depends=('glibc')
provides=('exfat-utils')
conflicts=('fuse-exfat' 'exfat-utils')
source=("exfat-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz"
        nofuse.patch)
b2sums=('a402a5cb1cc6357c7d8bdc3c0f52cd76ee5f0d01ae8f3c1ecbb3f1cfd149b1eb80099e021c27c4e6f1c306901e79b0e7543186f359db07ccd0f85f847ad6cd34'
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
