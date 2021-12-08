# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.6.1
pkgrel=2
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('68e114eeb1a7ae8a4ce52a7de31095c46d0ba8f572676a8ef1e858b97da199c04ec88656c7642160ba07b7db325cc2a49cd91794da8dd2e81a5301d089c34f90'
            'SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446') # Remi Gacogne <remi.gacogne@powerdns.com>
makedepends=('boost' 'systemd')
depends=('fstrm' 'gnutls' 'h2o-2.2' 'libcap' 'libedit' 'libsodium' 'libsystemd' 'lmdb' 'luajit' 'net-snmp' 'openssl' 're2' 'tinycdb')

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
