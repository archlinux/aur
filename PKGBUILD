# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>
# Contributor: Kaleb Elwert (belak) <belak@coded.io>
# Maintainer: Mattias Giese <mattiasgiese@posteo.net>

pkgname=bitlbee-libpurple-git
pkgver=3.5.1.r54.g246b98bb
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC'
url='http://www.bitlbee.org/'
license=('GPL')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('gnutls' 'glib2')
makedepends=('git' 'libotr' 'python' 'libpurple')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support')
source=(
    'bitlbee::git+https://github.com/bitlbee/bitlbee'
    'bitlbee.tmpfiles'
)
sha512sums=(
    'SKIP'
    'fe5ab700dfe77eab8366f2f1157bd3015898ede62ca41cc8f463c363a4ab1004023865ea38db6ac8e34b63da28aaeec929645bb11ebf5feffa4e5e088bdf7eca'
)
backup=(
    'etc/bitlbee/bitlbee.conf'
    'etc/bitlbee/motd.txt'
)
install=bitlbee.install
provides=('bitlbee')
conflicts=('bitlbee' 'bitlbee-bzr' 'bitlbee-libpurple' 'bitlbee-git')

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
    --skype=plugin \
    --purple=1

  make
}

package() {
  cd "$srcdir/bitlbee"
  make DESTDIR="$pkgdir" install{,-etc,-dev,-systemd}

  install -o65 -g65 -dm770 "$pkgdir/var/lib/bitlbee"
  install -Dm644 "$srcdir/bitlbee.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/bitlbee.conf"
}
