# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.3.0
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('35c5dd1f5104ed7f043ce04cbaac14e2eebb2b61ed827e838f5ac0ee1fd4afd4310853df8a193abc37654d2438b10297c611d4b05d8d1bd5e50424d1409851dc'
            'SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446') # Remi Gacogne <remi.gacogne@powerdns.com>
makedepends=('boost' 'systemd')
depends=('fstrm' 'gnutls' 'libedit' 'libsodium' 'libsystemd' 'luajit' 'net-snmp' 'openssl' 'protobuf' 're2')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-ebpf \
    --with-luajit \
    --with-protobuf \
    --enable-dns-over-tls \
    --enable-dnscrypt \
    --enable-gnutls \
    --enable-libsodium \
    --enable-libssl \
    --enable-fstrm \
    --enable-re2 \
    --enable-systemd
  make
  sed -i 's,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog -u dnsdist,' dnsdist.service
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
