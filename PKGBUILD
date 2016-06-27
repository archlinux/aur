# Maintainer: Remi Gacogne <rgacogne-arch at coredump dot fr>
pkgname=dnsdist
pkgver=1.0.0
pkgrel=2
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('i686' 'x86_64')
url='http://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc})
md5sums=('b3bd87d28965eced28feac651b174935'
         'SKIP')
sha512sums=('89a926900c0fb16ed64dce1bc5a075899633ede7e4539bc17b388d4535aa751f2649bc66c77cff15bf964371ee44b7fbfa55c08eec625d72eb0eeab590e2cc14'
            'SKIP')
validpgpkeys=('B76CD4671C0968BAA87DE61C5E50715BF2FFE1A7') # Pieter Lexis <pieter.lexis@powerdns.com>
makedepends=('boost' 'git' 'pandoc' 'ragel')
depends=('libedit' 'libsodium' 'libsystemd' 'lua' 'protobuf')
provides=('dnsdist')
conflicts=('dnsdist')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-libsodium \
    --enable-dnscrypt
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog -u nobody -g nobody,' dnsdist.service
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
