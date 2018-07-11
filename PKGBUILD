# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.3.2
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('af7c360d6a5255bc9588622747b8939d30669e2d7d749275b30a9be8cf306a92768327057a93bfa901c44ac8a7572c9bb801a7f6ceca6d736f3e9c71f80f5726'
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
    --with-lua=luajit \
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
