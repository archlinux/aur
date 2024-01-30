# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist-git
pkgver=1.9.0rc1.r3.gc230fb89c
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL-2.0-only')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
makedepends=('boost' 'git' 'pandoc' 'python-virtualenv' 'ragel' 'systemd')
depends=('fstrm' 'gnutls' 'h2o-2.2' 'libbpf' 'libcap' 'libedit' 'libnghttp2' 'libsodium' 'libsystemd' 'libxdp' 'lmdb' 'luajit' 'net-snmp' 'openssl' 'quiche' 're2' 'tinycdb')
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
    --with-h2o \
    --with-libsodium \
    --with-libssl \
    --with-net-snmp \
    --with-nghttp2 \
    --with-quiche \
    --with-re2 \
    --with-xsk \
    --enable-dnstap \
    --enable-dns-over-quic \
    --enable-dns-over-http3 \
    --enable-dns-over-https \
    --enable-dns-over-tls \
    --enable-dnscrypt \
    --enable-systemd \
    --enable-lto=thin \
    --enable-auto-var-init=zero \
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
