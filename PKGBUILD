# Maintainer: Daurnimator  <daurnimator@archlinux.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dwayne Bent <dbb@dbb.io>
# Contributor: Tilman Vatteroth <tilman.vatteroth@uni-dortmund.de>
# Contributor: Paul-Sebastian Manole <brokenthorn@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>

pkgname=prosody-hg-stable
pkgver=0.12.r12393+.6966026262f4+
pkgrel=1
pkgdesc="Lightweight and extensible Jabber/XMPP server written in Lua (latest from stable-branch)"
arch=('i686' 'x86_64' 'armv7h')
url="https://prosody.im/"
license=('MIT')
depends=('lua'
         'lua-sec'
         'lua-socket'
         'lua-expat'
         'lua-filesystem'
         'libidn')
makedepends=('mercurial')
conflicts=('prosody' 'prosody-hg')
provides=('prosody=0.12')
optdepends=(
            'lua-event: libevent support'
            'lua-dbi: SQL storage support'
            'luarocks: plugin manager')
install=prosody.install
backup=('etc/prosody/prosody.cfg.lua')
source=("prosody-hg::hg+https://hg.prosody.im/trunk/#branch=0.12"
        'prosody.tmpfile.d'
        'prosody.logrotated'
        'sysuser.conf'
        'prosody.service')
sha256sums=('SKIP'
            '0753bd9260f1cfdce6e18e01a61e320b396acfe9fca8ccf3250653bfa6af997e'
            '5a2466b73bd069fb73be97a4e23b24e4c8dd1adb7db871cb8f5ab4094c1f967f'
            'e5c30ffbb066f0ed3444475b3313490c535d8c9df018726f6cecf9e3ddfd2e48'
            'e9d6abc4c53bd9e7b1d2acc56c7513416751f9436bf382ed52d703d29b13bfaa')


pkgver() {
  cd prosody-hg
  printf "0.12.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd prosody-hg

  # disable logging to output and activate syslog
  sed -i s/"info = "/"-- info = "/g prosody.cfg.lua.dist
  sed -i s/"error = "/"-- error = "/g prosody.cfg.lua.dist
  sed -i s/"--\ \"\*syslog\"\;"/"info = \"*syslog\"\;"/g prosody.cfg.lua.dist

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

build() {
  cd prosody-hg
  ./configure \
    --ostype=linux \
    --prefix=/usr \
    --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody \
    --with-lua-include=/usr/include/ \
    --idn-library=idn \
    --cflags="${CPPFLAGS} ${CFLAGS} -fPIC -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" \
    --no-example-certs \
    --runwith=lua \
    --lua-version=5.4
  make
}

package() {
  cd prosody-hg
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C tools/migration

  install -Dm 0644 "$srcdir"/prosody.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/prosody.conf
  install -Dm 0644 "$srcdir"/prosody.service "${pkgdir}"/usr/lib/systemd/system/prosody.service
  install -Dm644 "$srcdir"/sysuser.conf "$pkgdir"/usr/lib/sysusers.d/prosody.conf

  for i in tools/*.lua; do
    install -Dm 0644 ${i} "${pkgdir}"/usr/share/prosody/${i}
  done

  install -Dm 0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -Dm 0644 "$srcdir"/prosody.logrotated "${pkgdir}"/etc/logrotate.d/prosody
  rm "${pkgdir}"/etc/prosody/certs/*
}
