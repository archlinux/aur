# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Kaleb Elwert (belak) <belak@coded.io>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>

pkgname=bitlbee-git
pkgver=3.5.1.r0.g262a82b8
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC'
url='http://www.bitlbee.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gnutls' 'glib2')
makedepends=('git' 'libotr' 'python')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support')
source=('bitlbee::git+https://github.com/bitlbee/bitlbee'
        'bitlbee.tmpfiles')
sha1sums=('SKIP'
          '3695ed2fe22436c4d0fc3ead829f7d1f89bc491c')
backup=('etc/bitlbee/bitlbee.conf'
        'etc/bitlbee/motd.txt')
install=bitlbee.install
provides=('bitlbee')
conflicts=('bitlbee' 'bitlbee-bzr')

pkgver() {
  cd "$srcdir/bitlbee"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/bitlbee"

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

package() {
  cd "$srcdir/bitlbee"
  make DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm770 "$pkgdir/var/lib/bitlbee"
  install -Dm644 "$srcdir/bitlbee.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bitlbee.conf"
}
