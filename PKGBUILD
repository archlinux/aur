# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: simo <simo@archlinux.org>
# Contributor: FUBAR <mrfubar@gmail.com>

pkgname=bitlbee
pkgver=3.6
pkgrel=2
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC'
url=https://www.bitlbee.org/
license=('GPL')
arch=('x86_64')
depends=('glib2' 'gnutls')
makedepends=('libotr' 'python')
optdepends=('libotr: for OTR encryption support')
source=("https://get.bitlbee.org/src/$pkgname-$pkgver.tar.gz"
        'bitlbee.sysusers.conf'
        'bitlbee.tmpfiles')
sha512sums=('ccbf0f23e228de2de147241f36f59744b2256cba958e2fabfba0cfa60935e55bbb7d7e20fffa54da9a345e55ffa9ca82cb62e9b99dc738ba35c6e268c6561a8d'
            '0a0a0af34144b500fdb4c944e56baf9387e0031a028b80888bfcbde40c3c4e542b4f5079b2ac4890078757cc1dcdcd40dd27ee56b73af7a8df5751308a00ac80'
            'b073dad94e33e1599d114e2c5bbdd4950119006dac7507ad5646b73c20a471709aa8acc7b92284267c0503a6fb614462bb0a34ae38df9580b8dcea18e4c5b76e')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --etcdir=/etc/bitlbee \
    --sbindir=/usr/bin \
    --pidfile=/run/bitlbee/bitlbee.pid \
    --ipcsocket=/run/bitlbee/bitlbee.sock \
    --systemdsystemunitdir=/usr/lib/systemd/system \
    --ssl=gnutls \
    --otr=plugin

  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm770 "$pkgdir"/var/lib/bitlbee
  install -Dm644 bitlbee.sysusers.conf "$pkgdir"/usr/lib/sysusers.d/bitlbee.conf
  install -Dm644 bitlbee.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/bitlbee.conf
}
