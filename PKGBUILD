
# Contributor: Fernando Jiménez Solano (fjim) <fjim@sdfeu.org>
# Contributor: FUBAR <mrfubar@gmail.com>
# Contributor: simo <simo@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Maintainer: dx <dx@dxzone.com.ar>

pkgname=bitlbee-libpurple
_pkgname=bitlbee
pkgver=3.4
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC. libpurple enabled.'
url='http://www.bitlbee.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gnutls' 'glib2' 'libpurple')
makedepends=('asciidoc' 'libotr')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support')
provides=('bitlbee=3.4')
conflicts=('bitlbee')
source=("http://get.bitlbee.org/src/${_pkgname}-${pkgver}.tar.gz"
        'bitlbee.tmpfiles')
sha1sums=('3b22d9da741903a293fe3c25511448276c75b58a'
          '3695ed2fe22436c4d0fc3ead829f7d1f89bc491c')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt')
install=${_pkgname}.install

build() {
  cd "${_pkgname}-$pkgver"

  ./configure \
    --prefix=/usr \
    --etcdir=/etc/bitlbee \
    --sbindir=/usr/bin \
    --pidfile=/run/bitlbee/bitlbee.pid \
    --ipcsocket=/run/bitlbee/bitlbee.sock \
    --systemdsystemunitdir=/usr/lib/systemd/system \
    --ssl=gnutls \
    --strip=0 \
    --otr=plugin \
    --skype=plugin \
    --purple=1

  make
}

package() {
  make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm770 "$pkgdir/var/lib/bitlbee"
  install -Dm644 "$srcdir/bitlbee.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bitlbee.conf"
}
