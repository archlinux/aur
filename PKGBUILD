# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.9.0
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL-2.0-only')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('32c0b9b3a1b58839da6dbde05eee382b78fbe58d68aed14f4927dc172dfcb15ba68b6d2246a8305b709e136e0e0c8666b6dd139ac258c8209083ff3b5673b997'
            'SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446'   # Remi Gacogne <remi.gacogne@powerdns.com>
              'FBAE0323821C7706A5CA151BDCF513FA7EED19F3')  # Peter van Dijk <peter.van.dijk@powerdns.com>
makedepends=('boost' 'systemd')
depends=('fstrm' 'gnutls' 'libbpf' 'libcap' 'libedit' 'libnghttp2' 'libsodium' 'libsystemd' 'libxdp' 'lmdb' 'luajit' 'net-snmp' 'openssl' 'quiche' 're2' 'tinycdb')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-ebpf \
    --with-gnutls \
    --with-libsodium \
    --with-libssl \
    --with-net-snmp \
    --with-nghttp2 \
    --with-quiche \
    --with-re2 \
    --with-xsk \
    --enable-dnstap \
    --enable-dns-over-http3 \
    --enable-dns-over-https \
    --enable-dns-over-tls \
    --enable-dns-over-quic \
    --enable-dnscrypt \
    --enable-systemd \
    --enable-lto=thin \
    --enable-auto-var-init=zero \
    --with-service-user=dnsdist \
    --with-service-group=dnsdist
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
