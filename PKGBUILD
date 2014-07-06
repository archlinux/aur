# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>

pkgname=bitlbee-bzr
pkgver=1025
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC'
url='http://www.bitlbee.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gnutls' 'glib2')
makedepends=('bzr' 'asciidoc' 'libotr' 'xmlto' 'lynx')
checkdepends=('check')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support'
            'xinetd: to run bitlbee through xinetd')
source=('bitlbee::bzr+http://code.bitlbee.org/bitlbee/'
        'xinetd'
        'bitlbee.tmpfiles')
sha1sums=('SKIP'
          '5e0af27ba9cc4fe455e3381c75fc49a9326e2f17'
          '3695ed2fe22436c4d0fc3ead829f7d1f89bc491c')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt'
        'etc/xinetd.d/bitlbee')
install=bitlbee.install
provides=('bitlbee')
conflicts=('bitlbee')
_bzrmod=bitlbee

pkgver() {
  cd "$srcdir/$_bzrmod"
  bzr revno
}

build() {
  cd "$srcdir/$_bzrmod"

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
    --skype=plugin

  make
}

#check() {
#  cd "$srcdir/bitlbee"
#  make check
#}

package() {
  cd "$srcdir/$_bzrmod"
  make DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm770 "$pkgdir/var/lib/bitlbee"
  install -Dm644 "$srcdir/xinetd" "$pkgdir/etc/xinetd.d/bitlbee"
  install -Dm644 "$srcdir/bitlbee.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bitlbee.conf"
}

# vim:set ts=2 sw=2 et:
