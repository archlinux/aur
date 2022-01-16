# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Alex <mail.avatar@gmail.com>

pkgname=exfat-utils-timezone
pkgver=1.3.0
pkgrel=1
pkgdesc='Utilities for exFAT file system - with timezone support patch (see URL)'
url='https://github.com/relan/exfat/pull/119'
arch=('x86_64')
license=('GPL2')
depends=('glibc' 'fuse2')
conflicts=('exfat-utils')
provides=('exfat-utils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/relan/exfat/archive/v${pkgver}.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/relan/exfat/pull/119.patch")
sha512sums=('fa3951e16889db65685e1fb71b0c75fc7014a8025c3442bf6164b94ddd51d282a8ae5e891c46195be53d2a10d62444e2fa1bb3fa3de59c2c3411c6dac363b488'
            '28f64e58c2269a9dab7051a48d94f148765b21f357eb08bb6767aad1440416991321681c4a9779e914ec5ce5041ed78ff7d73ba166993335f8f88261a3121d56')

prepare() {
  cd exfat-${pkgver}
  patch -p1 -i ../119.patch
  autoreconf -fiv
}

build() {
  cd exfat-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
  make CCFLAGS="${CFLAGS} ${CPPFLAGS} -std=c99" LINKFLAGS="${LDFLAGS}"
}

package() {
  cd exfat-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 */*.8 -t "${pkgdir}/usr/share/man/man8"
}

# vim: ts=2 sw=2 et:
