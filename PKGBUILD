# Submitter: Maxime Buquet <tidusx62 at gmail dot com>
# Maintainer: Jesse Watson <me@9mmtylenol.me>
pkgname=metronome-hg
pkgver=3.7.7
pkgrel=1
pkgdesc="LW.Org IM's XMPP Server Development"
arch=('i686' 'x86_64')
url="http://www.lightwitch.org/"
license=('MIT' 'ISC')
depends=('lua51' 'lua51-socket' 'lua51-expat' 'lua51-filesystem' 'lua51-event'
   'lua51-sec' 'libidn' 'openssl')
optdepends=('lua51-zlib: compression support')
makedepends=('mercurial')
backup=('etc/metronome/metronome.cfg.lua')
install=metronome.install
source=('metronome.service'
        'fix-config.patch'
        'metronome::hg+http://code.lightwitch.org/metronome')
md5sums=('5c418a4215426021deaadb23228b750e'
         '79a390c8f661fb6242dc8997b5879efc'
         'SKIP')

_hgrepo='metronome'

pkgver() {
  cd $srcdir/$_hgrepo
  cat metronome.release
}

prepare() {
  cd $srcdir/$_hgrepo
  patch -p1 metronome.cfg.lua.dist < $srcdir/fix-config.patch
  sed -i -e 's/^\(#!\/usr\/bin\/env\) lua$/\1 lua5.1/' metronome metronomectl
}

build() {
  cd "$srcdir/$_hgrepo"
  ./configure --ostype=linux --prefix=/usr \
  --with-lua-include=/usr/include/lua5.1 --with-lua=/usr/bin/lua5.1 \
  --with-lua-lib=/usr/lib/lua/5.1 --lua-suffix=5.1 \
  --sysconfdir=/etc/metronome --datadir=/var/lib/metronome
  make
}

package() {
  cd "$srcdir/$_hgrepo"
  make DESTDIR="$pkgdir" install
  
  # install -dm755 $pkgdir/var/log/metronome # $pkgdir/run/metronome
  install -Dm644 scripts/logrotate $pkgdir/etc/logrotate.d/metronome
  install -Dm644 LICENSE $pkgdir/usr/share/licences/$pkgname/LICENCE
  install -Dm644 $srcdir/metronome.service $pkgdir/usr/lib/systemd/system/metronome.service
}

# vim:set ts=2 sw=2 et:
