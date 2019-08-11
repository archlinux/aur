# Submitter: Marco Cirillo <maranda@lightwitch.org>
# Maintainer: Marco Cirillo <maranda@lightwitch.org>
pkgname=metronome-dev
pkgver=3.12.1
pkgrel=1
pkgdesc="Metronome IM XMPP Server Development"
arch=('i686' 'x86_64')
url="https://metronome.im/"
license=('MIT' 'ISC')
depends=('lua52' 'lua52-socket' 'lua52-expat' 'lua52-filesystem'
	 'lua52-event' 'lua52-sec' 'libidn' 'openssl' 'libevent')
optdepends=('lua52-zlib: compression support')
makedepends=('git')
backup=('etc/metronome/metronome.cfg.lua')
install=metronome.install
source=('metronome.service'
        'metronome::git+https://github.com/maranda/metronome.git')
md5sums=('1f2e66ce577c22ad07b7876cfc379b79'
         'SKIP')

_repo='metronome'

pkgver() {
  cd $srcdir/$_repo
  cat metronome.release
}

build() {
  cd "$srcdir/$_repo"
  ./configure --ostype=linux --prefix=/usr \
  --with-lua-include=/usr/include/lua5.1 --with-lua=/usr/bin/lua5.1 \
  --with-lua-lib=/usr/lib/lua/5.1 --lua-suffix=5.1 \
  --sysconfdir=/etc/metronome --datadir=/var/lib/metronome
  make
}

package() {
  cd "$srcdir/$_repo"
  make DESTDIR="$pkgdir" install
  
  # install -dm755 $pkgdir/var/log/metronome # $pkgdir/run/metronome
  install -Dm644 scripts/logrotate $pkgdir/etc/logrotate.d/metronome
  install -Dm644 LICENSE $pkgdir/usr/share/licences/$pkgname/LICENCE
  install -Dm644 $srcdir/metronome.service $pkgdir/usr/lib/systemd/system/metronome.service
}

# vim:set ts=2 sw=2 et:
