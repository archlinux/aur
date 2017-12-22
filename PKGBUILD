# Maintainer: Pieter Lexis <pieter.lexis[at]powerdns[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Steffens <heftig@archlinux.org>
# Contributor: Remi Gacogne <rgacogne[at]archlinux[dot]org>

pkgname=powerdns-recursor-41
pkgver=4.1.0
pkgrel=2
pkgdesc='PowerDNS Recursor, a resolving nameserver. Version 4.1.x'
url='https://www.powerdns.com/'
arch=('x86_64')
license=('GPL2')
depends=('gcc-libs' 'boost-libs' 'libsystemd' 'luajit' 'openssl' 'protobuf' 'botan' 'net-snmp'
         'libsodium' 'libboost_context.so')
makedepends=('boost' 'inetutils' 'systemd')
provides=('pdns-recursor' 'powerdns-recursor')
conflicts=('pdns-recursor' 'powerdns-recursor')
backup=('etc/powerdns/recursor.conf')
source=(https://downloads.powerdns.com/releases/pdns-recursor-${pkgver}.tar.bz2{,.asc}
        sysusers.conf)
sha512sums=('1e4d70f3794005c3f45b2ec0ab580c3697e7de3096f3378b9b9d1cd53f10f95e577522ca9f634eb235b166f007e8a2bfa99f312ddf19f266ad4bb0965167fd7c'
            'SKIP'
            'be46143994861b0496da2ef032e80932b069547774f66c376b342d766db7483a97fbd86e2b473db62338269170650deca8bb8ed9ca39e8e1de5a6d2ed23dad77')
validpgpkeys=('B76CD4671C0968BAA87DE61C5E50715BF2FFE1A7'  # Pieter Lexis <pieter.lexis@powerdns.com>
              'FBAE0323821C7706A5CA151BDCF513FA7EED19F3'  # Peter van Dijk <peter.van.dijk@powerdns.com>
              '16E12866B7738C73976A57436FFC33439B0D04DF') # Winkels, Erik <erik.winkels@open-xchange.com>

build() {
  cd pdns-recursor-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/powerdns \
    --disable-silent-rules \
    --enable-reproducible \
    --enable-systemd \
    --enable-libsodium \
    --with-luajit \
    --enable-botan \
    --with-net-snmp
  make
}

package() {
  cd pdns-recursor-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  mv "${pkgdir}/etc/powerdns/recursor.conf"{-dist,}
  for setting in setuid setgid; do
    sed -i "s/^# ${setting}.*/${setting}=powerdns-recursor/" "${pkgdir}/etc/powerdns/recursor.conf"
  done
}

# vim: ts=2 sw=2 et:
