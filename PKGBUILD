# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.7.3
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('2a39096709db5b41cf3bd21170689bc85ad2cd550896d02ddd85eff7410780ea59d6cf8e08b0a08962ee93b49b7f3228dfa649275453215e23c25098aca40e1a'
            'SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446'   # Remi Gacogne <remi.gacogne@powerdns.com>
              'FBAE0323821C7706A5CA151BDCF513FA7EED19F3')  # Peter van Dijk <peter.van.dijk@powerdns.com>
makedepends=('boost' 'systemd')
depends=('fstrm' 'gnutls' 'h2o-2.2>=2.2.6-4' 'libcap' 'libedit' 'libnghttp2' 'libsodium' 'libsystemd' 'lmdb' 'luajit' 'net-snmp' 'openssl' 're2' 'tinycdb')

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
    --with-nghttp2 \
    --with-re2 \
    --enable-dnstap \
    --enable-dns-over-tls \
    --enable-dns-over-https \
    --enable-dnscrypt \
    --enable-systemd \
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
