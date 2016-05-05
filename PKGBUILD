# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <f-p@gmx.at>
# Contributor: Xyne <xyne at archlinux dot us>
# Contributor: thiagoc
# Contributor: Chris <chris at christopherjones dot us>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: Fabiano Furtado <fusca14 at gmail dot com>

pkgname=fwknop-git
_pkgname=${pkgname/-git}
pkgver=2.6.8.2341.29411de
pkgrel=3
pkgdesc='FireWall KNock OPerator: Single Packet Authorization and Port Knocking'
url='https://www.cipherdyne.org/fwknop'
arch=('i686' 'x86_64')
license=('GPL2')
backup=(etc/${_pkgname}/access.conf
        etc/${_pkgname}/fwknopd.conf)
depends=('gpgme' 'iptables' 'libpcap' 'wget')
makedepends=('git')
provides=('fwknop')
conflicts=('fwknop')
options=('!libtool')
source=(${pkgname}::git+https://github.com/mrash/fwknop
        fwknopd.service)
sha512sums=('SKIP'
            'a171682a054495bb10315e98a300ddbe4adf1f653b719d3344ecb6cfb8ccd15043cffbbd28304c4f15569a12ddcd9733409448d596f0c706e48d4fda2c877a6a')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  autoreconf -fiv
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/fwknopd.service" "${pkgdir}/usr/lib/systemd/system/fwknopd.service"
}

# vim: ts=2 sw=2 et:
