# $Id: PKGBUILD 143420 2015-10-08 11:02:55Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Dwayne Bent <dbb@dbb.io>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@uni-dortmund.de>
# Contributor: Paul-Sebastian Manole <brokenthorn@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>

pkgname=prosody-hg-stable
pkgrel=1
pkgver=0.10.r7186+.dbdaa8487ecd+
pkgver() {
  cd "$srcdir/prosody-hg"
  printf "0.10.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
pkgdesc="Lightweight and extensible Jabber/XMPP server written in Lua (stable build from 0.10-branch)"
arch=('i686' 'x86_64' 'armv7h')
url="https://prosody.im/"
license=('MIT')
depends=('lua51' 'lua51-socket' 'lua51-expat' 'lua51-filesystem' 'libidn'
         'openssl')
makedepends=('mercurial')
conflicts=('prosody')
provides=('prosody')
optdepends=(
'lua51-sec: TLS encryption support' 
'lua51-bitop: websocket support'
'lua51-event: libevent support'
)
install=prosody.install
backup=('etc/prosody/prosody.cfg.lua')
source=("prosody-hg::hg+https://hg.prosody.im/0.10"
        'prosody.tmpfile.d'
        'sysuser.conf'
        'prosody.service')

prepare() {
  cd prosody-hg

  # disable logging to output and activate syslog
    sed -i s/"info = "/"-- info = "/g prosody.cfg.lua.dist
    sed -i s/"error = "/"-- error = "/g prosody.cfg.lua.dist
    sed -i s/"--\ \"\*syslog\"\;"/"\"*syslog\"\;"/g prosody.cfg.lua.dist


  # add pidfile and daemonize
  # daemonize is important for systemd!
    mv prosody.cfg.lua.dist prosody.cfg.lua.old

    echo --Important for systemd >> prosody.cfg.lua.dist
    echo -- daemonize is important for systemd. if you set this to false the systemd startup will freeze. >> prosody.cfg.lua.dist
    echo daemonize = true >> prosody.cfg.lua.dist
    echo 'pidfile = "/run/prosody/prosody.pid"'>> prosody.cfg.lua.dist
    echo "" >> prosody.cfg.lua.dist
    cat prosody.cfg.lua.old >> prosody.cfg.lua.dist
    rm prosody.cfg.lua.old
}

build() {
  cd prosody-hg
  ./configure --ostype=linux --prefix=/usr --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody --with-lua-include=/usr/include/lua5.1 \
    --cflags="${CFLAGS} -fPIC -Wall -Wextra -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" --no-example-certs \
    --runwith=lua5.1
  make
}

package() {
  cd prosody-hg
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C tools/migration

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
         'dc8405a6a235b83dc8a0dcdf7b71cbaa'
         '385ca73d9f6046f3636266ce9bf38797'
         'e74045f27cb60908d535969906781f75')
