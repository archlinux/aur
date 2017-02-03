
# Contributor: Fernando Jiménez Solano (fjim) <fjim@sdfeu.org>
# Contributor: FUBAR <mrfubar@gmail.com>
# Contributor: simo <simo@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Ray Song <i@maskray.me>

pkgname=bitlbee-libpurple-unicode-channel
_pkgname=bitlbee
pkgver=3.5.1
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC. libpurple enabled. (patched for unicode channel names)'
url='http://www.bitlbee.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('gnutls' 'glib2' 'libpurple')
makedepends=('libotr' 'python')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support')
provides=("bitlbee=${pkgver}")
conflicts=('bitlbee' 'bitlbee-libpurple')
source=("http://get.bitlbee.org/src/${_pkgname}-${pkgver}.tar.gz"
        'bitlbee.tmpfiles' 'unicode-channel.patch')
sha1sums=('de0767facdb7729253ae4d6ef6e3637ebd54939a'
          '3695ed2fe22436c4d0fc3ead829f7d1f89bc491c'
          'a3f9bc95b5f1518cf619e220e2f8be6110fb3e40')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt')
install=${_pkgname}.install

prepare() {
  cd "${_pkgname}-$pkgver"
  patch -p1 < $srcdir/unicode-channel.patch
}

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
    --purple=1 \
    --jabber=1

  make
}

package() {
  make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm770 "$pkgdir/var/lib/bitlbee"
  install -Dm644 "$srcdir/bitlbee.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bitlbee.conf"
}
