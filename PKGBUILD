# Maintainer: Remi Gacogne <rgacogne-arch at archlinux dot org>
pkgname=powerdns-recursor-git
pkgver=5.2.0alpha0.r2.g598b537e8
pkgrel=1
pkgdesc='Resolving DNS server'
arch=('x86_64')
url='https://www.powerdns.com/'
license=('GPL-2.0-only')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            '63b3f0664d38fbbcb6b1c914cee050a27eca0a15550962973743580dd5d3ace2e68272ca2d856d53cc74001fe9246d61207ebbc74524c096736777ed08c88e72')
makedepends=('boost' 'git' 'pandoc' 'python-virtualenv' 'ragel' 'rust' 'systemd')
depends=('gcc-libs' 'boost-libs' 'fstrm' 'libboost_context.so' 'libcurl.so' 'libsodium' 'systemd-libs' 'luajit' 'net-snmp' 'openssl')
provides=('powerdns-recursor')
conflicts=('powerdns-recursor')
backup=('etc/powerdns/recursor.conf')
options=(!lto)

prepare() {
  cd "${pkgname}/pdns/recursordist"
  autoreconf -i
}

pkgver() {
  cd "${pkgname}"
  git describe --tags --match 'rec-*' | sed 's/rec-//;s/.\(\(rc\|alpha\|beta\)\d*\)/\1/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}/pdns/recursordist"
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/powerdns \
    --disable-silent-rules \
    --enable-reproducible \
    --enable-systemd \
    --enable-dns-over-tls \
    --with-libsodium \
    --with-lua=luajit \
    --with-net-snmp \
    --enable-auto-var-init=zero \
    --with-service-user=pdns-recursor \
    --with-service-group=pdns-recursor \
    --with-libcrypto=/usr # workaround for https://github.com/PowerDNS/pdns/issues/14084
  make
}

package() {
  cd "${pkgname}/pdns/recursordist/"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/powerdns/recursor.yml-dist" "${pkgdir}/etc/powerdns/recursor.yml"
  install -Dm 644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/powerdns-recursor.conf"
}

# vim: ts=2 sw=2 et:
