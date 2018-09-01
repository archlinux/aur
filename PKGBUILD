# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=coturn-git
pkgver=4.5.0.7+74+g7e782a5
pkgrel=1
pkgdesc='Free open-source implementation of TURN and STUN server (git)'
arch=(i686 x86_64)
url=https://github.com/coturn/coturn
license=(custom:BSD)
depends=(libevent postgresql-libs libmariadbclient hiredis sqlite)
provides=(coturn)
conflicts=(coturn)
install=turnserver.install
backup=(etc/turnserver.conf)
source=(git+$url
        turnserver.service
        turnserver.tmpfiles.d)
sha512sums=('SKIP'
            'd86ba037fcd1873fc8a8e60c0cc1b30b3b9a082681c611b6580ee1c3fbede61666ddcafdf26491fe3993953bd08b8d8d6b20cc0412798441cd70e2f4195f4ea6'
            '16810f12ebf75e744f6eaf12ebbb727823de2cc6ffb77fefbbae2021a1699a4ff6627c6171005d84468f391f1722cd4bd092c01431516d065fb4a557cdc1d50a')

pkgver() {
  cd coturn
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd coturn
  ./configure --prefix=/usr --manprefix=/usr/share --examplesdir=/usr/share/turnserver/examples --disable-rpath
  make
}

check() {
  cd coturn
  make check
}

package() {
  install -Dm 644 turnserver.service "$pkgdir"/usr/lib/systemd/system/turnserver.service
  install -Dm 644 turnserver.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/turnserver.conf
  cd coturn
  make DESTDIR="$pkgdir" install
  mkdir "$pkgdir"/etc
  mv "$pkgdir"/{usr/etc/turnserver.conf.default,etc/turnserver.conf}
  rmdir "$pkgdir"/usr/etc
  sed \
    -e '/^#log-file=\/var\/tmp\/turn.log$/c log-file=\/var\/log\/turnserver\/turn.log' \
    -i "$pkgdir"/etc/turnserver.conf
  sed \
    -e '/^#pidfile="\/var\/run\/turnserver.pid"$/c pidfile="\/var\/run\/turnserver\/turnserver.pid"' \
    -i "$pkgdir"/etc/turnserver.conf
  find "$pkgdir"/{etc,usr/include,usr/lib,usr/share,var} -type f ! -name '*.sh' ! -name '*.pl' -exec chmod 644 {} +
  mkdir -p "$pkgdir"/var/log/turnserver
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/coturn LICENSE
  }
