# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.2.0
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('i686' 'x86_64')
url='http://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc})
sha512sums=('93f8c5f18462d3291c973a690f6ac2b3c5791d9947bee83d9250b503b7526de365bdcb530f3b082e51ae168a9129e77d5558af7cc3b9d2e98a585af53783c237'
            'SKIP')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446') # Remi Gacogne <remi.gacogne@powerdns.com>
makedepends=('boost' 'pandoc' 'python-virtualenv' 'ragel' 'systemd')
depends=('libedit' 'libsodium' 'libsystemd' 'lua' 'net-snmp' 'protobuf' 're2')
provides=('dnsdist')
conflicts=('dnsdist')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-libsodium \
    --enable-dnscrypt \
    --enable-re2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog -u nobody -g nobody,' dnsdist.service
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
