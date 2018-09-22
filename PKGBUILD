# $Id: PKGBUILD 143420 2015-10-08 11:02:55Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Dwayne Bent <dbb@dbb.io>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@uni-dortmund.de>
# Maintainer: Maxime “pep” Buquet <archlinux@bouah.net>
# Contributor: Paul-Sebastian Manole <brokenthorn@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>

pkgname=prosody-hg
pkgrel=1
pkgver=r9340+.368b092bf4bf+
pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
pkgdesc="Lightweight and extensible Jabber/XMPP server written in Lua (development build from trunk-branch)"
arch=('i686' 'x86_64' 'armv7h')
url="https://prosody.im/"
license=('MIT')
depends=('lua51' 'lua51-socket' 'lua51-expat' 'lua51-filesystem' 'libidn'
         'openssl')
makedepends=('mercurial')
checkdepends=('luacheck')
conflicts=('prosody')
provides=('prosody')
optdepends=(
'lua51-sec: TLS encryption support'
'lua51-bitop: websocket support'
'lua51-event: libevent support'
)
install=prosody.install
backup=('etc/prosody/prosody.cfg.lua')
source=("prosody-hg::hg+https://hg.prosody.im/trunk"
        'prosody.tmpfile.d'
        'sysuser.conf'
        'prosody.service')

prepare() {
  cd ${pkgname}

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


  #sed -i 's|sock, err = socket.udp();|sock, err = (socket.udp4 or socket.udp)();|g' net/dns.lua
}

check() {
  cd ${pkgname}

  make lint
}

build() {
  cd ${pkgname}
  ./configure --ostype=linux --prefix=/usr --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody --with-lua-include=/usr/include/lua5.1 \
    --cflags="${CFLAGS} -fPIC -Wall -Wextra -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" --no-example-certs \
    --runwith=lua5.1 \
    --lua-version=5.1
  make
}

package() {
  cd ${pkgname}
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
sha256sums=('SKIP'
            '343d7c61ee1c105d760480e9ba6a0655da6bd1a58335f4264a289ade96cffa4c'
            'e5c30ffbb066f0ed3444475b3313490c535d8c9df018726f6cecf9e3ddfd2e48'
            'af4ce76ae0a8773429eac53c72f1b87c8fa59c63acf003450f75dcb73131a21c')
