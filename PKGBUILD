# Maintainer: Remi Gacogne <rgacogne-arch at archlinux dot org>
pkgname=powerdns-recursor-git
pkgver=r17040.d26856a32
pkgrel=1
pkgdesc='Resolving DNS server'
arch=('x86_64')
url='https://www.powerdns.com/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns")
sha512sums=('SKIP')
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
      --with-lua=luajit \
      --with-libsodium
  make
}

package() {
  cd "${pkgname}/pdns/recursordist/"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/etc/powerdns/recursor.conf-dist" "${pkgdir}/etc/powerdns/recursor.conf"
}
