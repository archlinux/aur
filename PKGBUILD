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
pkgver=r10801+.2b97aac0ea3c+
pkgdesc="Lightweight and extensible Jabber/XMPP server written in Lua (development build from trunk-branch)"
arch=('i686' 'x86_64' 'armv7h')
url="https://prosody.im/"
license=('MIT')
depends=(
  'icu'
  'lua52'
  'lua52-socket'
  'lua52-expat'
  'lua52-filesystem'
  'lua52-sec')
makedepends=('mercurial')
checkdepends=('luacheck' 'shellcheck' 'lua52-posix' 'lua52-sec')
conflicts=('prosody')
provides=('prosody')
optdepends=(
  'lua52-event: libevent support')
install=prosody.install
backup=('etc/prosody/prosody.cfg.lua')
source=("prosody-hg::hg+https://hg.prosody.im/trunk"
        'prosody.tmpfile.d'
        'sysuser.conf'
        'prosody.service')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd ${pkgname}

  # disable logging to output and activate syslog
  sed -i s/"info = "/"-- info = "/g prosody.cfg.lua.dist
  sed -i s/"error = "/"-- error = "/g prosody.cfg.lua.dist
  sed -i s/"--\ \"\*syslog\"\;"/"\"*syslog\"\;"/g prosody.cfg.lua.dist

  ./configure --ostype=linux --prefix=/usr --sysconfdir=/etc/prosody \
    --datadir=/var/lib/prosody --with-lua-include=/usr/include/lua5.2 \
    --cflags="${CFLAGS} -fPIC -Wall -Wextra -D_GNU_SOURCE" \
    --ldflags="${LDFLAGS} -shared" --no-example-certs \
    --runwith=lua5.2 \
    --lua-version=5.2 \
    --idn-library=icu
}

build() {
  cd ${pkgname}
  make
}

check() {
  cd ${pkgname}
  make lint
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
            'fb025d8d0608dc9fd5be2fde8528bc4fa10d9e38874a98eaa5c56ca9ae048302'
            'e5c30ffbb066f0ed3444475b3313490c535d8c9df018726f6cecf9e3ddfd2e48'
            '40ea4a388ba69568daedde69b636d54747be1452e9d485fe19ee23320e66ada2')
