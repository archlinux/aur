# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist
pkgver=1.6.0
pkgrel=2
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=(https://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2{,.asc}
        fix_missing_mutex_header.patch::https://github.com/PowerDNS/pdns/commit/65bb0ab32a449d8fb8cf9a4802d16ba4912d9fc4.patch
        sysusers.conf)
sha512sums=('f6a1676c431d5622af075bc184c9f82b4ea0bb40ec84797a8fe835804f91bc0a93a745495f193bb52f3a5204ec0e98ed41bc206c997d1f5b13e872bb31747b0f'
            'SKIP'
            '16df904132e4d872d5848a52d2a2058ca22e4b6b5988208033cdc400924ffdb26d8ac08212229a3df3ac8a13ded491f7beef00f9c10dca18892d55bbdd739d08'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
validpgpkeys=('D6300CABCBF469BBE392E503A208ED4F8AF58446') # Remi Gacogne <remi.gacogne@powerdns.com>
makedepends=('boost' 'systemd')
depends=('fstrm' 'gnutls' 'h2o' 'libcap' 'libedit' 'libsodium' 'libsystemd' 'lmdb' 'luajit' 'net-snmp' 'openssl' 're2' 'tinycdb')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=2 --input="${srcdir}/fix_missing_mutex_header.patch"
}

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
