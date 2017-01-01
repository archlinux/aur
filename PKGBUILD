# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.1.0
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('i686' 'x86_64')
url='http://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc})
sha512sums=('91da716997c2440e153944f510a39dd86c9cf8ba8093a7f51a9a5d58ab0a1c230bd99ec57fe8ff0721279c8c4429ad576fe797c1fbe4cde2b9fb8f0405025320'
            'SKIP')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446') # Remi Gacogne <remi.gacogne@powerdns.com>
makedepends=('boost' 'pandoc' 'ragel' 'systemd')
depends=('libedit' 'libsodium' 'libsystemd' 'lua' 'protobuf' 're2')
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
