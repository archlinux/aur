# $Id: PKGBUILD 143420 2015-10-08 11:02:55Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Dwayne Bent <dbb@dbb.io>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@uni-dortmund.de>
# Contributor: Paul-Sebastian Manole <brokenthorn@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>

pkgname=prosody-hg
pkgrel=1
pkgver=0.10.r7373.9b37aaea68e9
pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.10.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
pkgdesc="Lightweight and extensible Jabber/XMPP server written in Lua (development build from trunk-branch)"
arch=('i686' 'x86_64' 'armv7h')
url="https://prosody.im/"
license=('MIT')
depends=('lua51' 'lua51-socket' 'lua51-expat' 'lua51-filesystem' 'libidn'
         'openssl')
makedepends=('mercurial')
conflics=('prosody')
provides=('prosody')
optdepends=('lua51-sec: TLS encryption support'
	    'lua51-zlib: compression support')
install=prosody.install
backup=('etc/logrotate.d/prosody'
        'etc/prosody/prosody.cfg.lua')
source=("prosody-hg::hg+https://hg.prosody.im/trunk"
        'prosody.logrotated'
        'prosody.tmpfile.d'
        'sysuser.conf'
        'prosody.service')

prepare() {
  cd ${pkgname}
  #sed -i 's|sock, err = socket.udp();|sock, err = (socket.udp4 or socket.udp)();|g' net/dns.lua
}

build() {
  cd ${pkgname}
  ./configure --ostype=linux --prefix=/usr --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody --with-lua-include=/usr/include/lua5.1 \
    --cflags="${CFLAGS} -fPIC -Wall -Wextra -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" --no-example-certs \
    --runwith=lua5.1
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C tools/migration

#  install -Dm 0644 $srcdir/prosody.logrotated "${pkgdir}"/etc/logrotate.d/prosody
  install -Dm 0644 $srcdir/prosody.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/prosody.conf
  install -Dm 0644 $srcdir/prosody.service "${pkgdir}"/usr/lib/systemd/system/prosody.service
  install -Dm644 $srcdir/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/prosody.conf

  for i in tools/*.lua; do
    install -Dm 0644 ${i} "${pkgdir}"/usr/share/prosody/${i}
  done

  install -Dm 0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  rm "${pkgdir}"/etc/prosody/certs/*
}

# vim: ft=sh syn=sh ts=2 sw=2
md5sums=('SKIP'
         '5b44aee99f1fa9e7f055e067688cafbd'
         'dc8405a6a235b83dc8a0dcdf7b71cbaa'
         '385ca73d9f6046f3636266ce9bf38797'
         'e74045f27cb60908d535969906781f75')
