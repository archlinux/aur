# Original Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Maintainer: MoeRT09 <https://aur.archlinux.org/account/MoeRT09>
# Maintainer: jlkon13 <internet@devpi.de>

pkgname=coturn
_portname=turnserver
pkgver=4.5.0.8
pkgrel=1
pkgdesc="Free open source implementation of TURN and STUN Server"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/coturn/coturn"
license=('custom:New BSD')
depends=('libevent' 'postgresql-libs' 'libmariadbclient' 'hiredis' 'sqlite')
conflicts=('rfc5766-turn-server')
provides=('rfc5766-turn-server')
install="$_portname.install"
backup=("etc/turnserver.conf")
source=(http://$_portname.open-sys.org/downloads/v$pkgver/$_portname-$pkgver.tar.gz $_portname.service $_portname.tmpfiles.d)

sha256sums=('94a9e67ac7d92c913b5bd8cb6b70ee6e9aa0e9e7cc3c984fc2d8cf381c6edf87'
            '319030c1916d353bfc3375626cc7f60d6eeca762fe4fce354f010212902c49dc'
            'fe7ed64dc6844aabdfa00b76134b22d69d9097bd3f77120d704d0ee08c036c21')

build() {
  cd "$srcdir/$_portname-$pkgver"

  ./configure --prefix=/usr --manprefix=/usr/share --examplesdir="/usr/share/$_portname/examples" --disable-rpath

  make
}

check() {
  cd "$srcdir/$_portname-$pkgver"

  make check
}

package() {
  cd "$srcdir/$_portname-$pkgver"
 
  make DESTDIR="$pkgdir" install

  install -D "$pkgdir/usr/share/$_portname/examples/etc/turnserver.conf" "$pkgdir/etc/turnserver.conf"
  
  rm -r "$pkgdir/usr/etc"

  chmod 644 "$pkgdir/usr/lib/libturnclient.a"

  install -Dm 644 "../$_portname.service" "$pkgdir/usr/lib/systemd/system/$_portname.service"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  sed \
          -e '/^#log-file=\/var\/tmp\/turn.log$/c log-file=\/var\/log\/turnserver\/turn.log' \
          -i "$pkgdir/etc/turnserver.conf"
  sed \
          -e '/^#pidfile="\/var\/run\/turnserver.pid"$/c pidfile="\/var\/run\/turnserver\/turnserver.pid"' \
          -i "$pkgdir/etc/turnserver.conf"

  install -Dm644 "$srcdir/$_portname.tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/$_portname.conf"
}
