# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.4.0
pkgrel=2
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('c9450e97325d8ad8c8c3a395412c46ea8053cbe1ebe73329a1618212ba29bdf2f8da908ae2b90c314b5aab613387f42363e3a5322b1a36f60190fb48e1c425c5'
            'SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446') # Remi Gacogne <remi.gacogne@powerdns.com>
makedepends=('boost' 'systemd')
depends=('fstrm' 'gnutls' 'h2o' 'libcap' 'libedit' 'libsodium' 'libsystemd' 'lmdb' 'luajit' 'net-snmp' 'openssl' 'protobuf' 're2' 'tinycdb')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-ebpf \
    --with-protobuf \
    --with-gnutls \
    --with-libsodium \
    --with-libssl \
    --with-re2 \
    --enable-dnstap \
    --enable-dns-over-tls \
    --enable-dns-over-https \
    --enable-dnscrypt \
    --enable-systemd
  make
  sed -i 's,CapabilityBoundingSet=CAP_NET_BIND_SERVICE CAP_SETGID CAP_SETUID,CapabilityBoundingSet=CAP_NET_BIND_SERVICE\nAmbientCapabilities=CAP_NET_BIND_SERVICE\nUser=dnsdist\nGroup=dnsdist,' dnsdist.service
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
