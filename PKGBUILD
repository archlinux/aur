# Maintainer: Remi Gacogne <rgacogne-arch at archlinux dot org>
pkgname=powerdns-recursor-git
pkgver=r19561.e5e184cb8
pkgrel=1
pkgdesc='Resolving DNS server'
arch=('x86_64')
url='https://www.powerdns.com/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            '63b3f0664d38fbbcb6b1c914cee050a27eca0a15550962973743580dd5d3ace2e68272ca2d856d53cc74001fe9246d61207ebbc74524c096736777ed08c88e72')
makedepends=('boost' 'git' 'pandoc' 'python-virtualenv' 'ragel' 'systemd')
depends=('boost-libs' 'fstrm' 'libsodium' 'libsystemd' 'luajit' 'net-snmp' 'openssl' 'protobuf' )
provides=('powerdns-recursor')
conflicts=('powerdns-recursor')
backup=('etc/powerdns/recursor.conf')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}/pdns/recursordist"
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/powerdns \
    --disable-silent-rules \
    --enable-reproducible \
    --enable-systemd \
    --with-protobuf \
    --with-libsodium \
    --with-lua=luajit \
    --with-service-user=pdns-recursor \
    --with-service-group=pdns-recursor
  make
}

package() {
  cd "${pkgname}/pdns/recursordist/"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/powerdns/recursor.conf-dist" "${pkgdir}/etc/powerdns/recursor.conf"

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/powerdns-recursor.conf"
}

# vim: ts=2 sw=2 et:
