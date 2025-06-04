# Maintainer: Daurnimator  <daurnimator@archlinux.org>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dwayne Bent <dbb@dbb.io>
# Contributor: Tilman Vatteroth <tilman.vatteroth@uni-dortmund.de>
# Contributor: Paul-Sebastian Manole <brokenthorn@gmail.com>
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>

pkgname=prosody-hg-stable
pkgver=13.0.r13892+.c83fdee8efda+
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
         'libidn'
         'openssl')
makedepends=('mercurial')
conflicts=('prosody' 'prosody-hg')
provides=('prosody=13.0')
optdepends=(
            'lua-event: libevent support'
            'lua-dbi: SQL storage support'
            'luarocks: plugin manager')
install=prosody.install
backup=('etc/prosody/prosody.cfg.lua')
source=("prosody-hg::hg+https://hg.prosody.im/trunk/#branch=13.0"
        'prosody.tmpfile.d'
        'prosody.logrotated'
        'sysuser.conf'
        'prosody.service')
sha256sums=('SKIP'
            '0753bd9260f1cfdce6e18e01a61e320b396acfe9fca8ccf3250653bfa6af997e'
            '5a2466b73bd069fb73be97a4e23b24e4c8dd1adb7db871cb8f5ab4094c1f967f'
            '211295ad5fe71742a8ec4a4420da31720e3bb407c6653250f9c6c7574e44f14e'
            'd50dfae041855e3c95551c3b4cff4ba9f8b2f00f5e5f79dd410836d88be33c12')


pkgver() {
  cd prosody-hg
  printf "13.0.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd prosody-hg

  # disable logging to output and activate syslog
  sed -i s/"info = "/"-- info = "/g prosody.cfg.lua.dist
  sed -i s/"error = "/"-- error = "/g prosody.cfg.lua.dist
  sed -i s/"--\ \"\*syslog\"\;"/"info = \"*syslog\"\;"/g prosody.cfg.lua.dist
}

build() {
  cd prosody-hg
  ./configure \
    --ostype=linux \
    --prefix=/usr \
    --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody \
    --idn-library=idn \
    --with-random=getrandom \
    --cflags="${CPPFLAGS} ${CFLAGS} -fPIC -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" \
    --no-example-certs
  make
}

package() {
  cd prosody-hg
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C tools/migration

  install -Dm644 "${srcdir}"/prosody.tmpfile.d "${pkgdir}"/usr/lib/tmpfiles.d/prosody.conf
  install -Dm644 "${srcdir}"/prosody.service "${pkgdir}"/usr/lib/systemd/system/prosody.service
  install -Dm644 "${srcdir}"/sysuser.conf "${pkgdir}"/usr/lib/sysusers.d/prosody.conf

  for i in tools/*.lua; do
    install -Dm644 "${i}" "${pkgdir}/usr/share/prosody/${i}"
  done

  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -Dm644 "${srcdir}"/prosody.logrotated "${pkgdir}"/etc/logrotate.d/prosody
  rm -- "${pkgdir}"/etc/prosody/certs/*
}
