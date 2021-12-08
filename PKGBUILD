# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist-git
pkgver=1.7.0beta2.r68.gba837d1ab
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
makedepends=('boost' 'git' 'pandoc' 'python-virtualenv' 'ragel' 'systemd')
depends=('fstrm' 'gnutls' 'h2o-2.2' 'libcap' 'libedit' 'libnghttp2' 'libsodium' 'libsystemd' 'lmdb' 'luajit' 'net-snmp' 'openssl' 're2' 'tinycdb')
provides=('dnsdist')
conflicts=('dnsdist')

prepare() {
  cd "${pkgname}/pdns/dnsdistdist"
  autoreconf -i
}

pkgver() {
  cd "${pkgname}"
  git describe --tags --match 'dnsdist-*' | sed 's/dnsdist-//;s/.\(\(rc\|alpha\|beta\)\d*\)/\1/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}/pdns/dnsdistdist"
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
  cd "${pkgname}/pdns/dnsdistdist/"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/dnsdist.conf"
}
