# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: MoeRT09 <https://aur.archlinux.org/account/MoeRT09>
# Contributor: jlkon13 <internet@devpi.de>

pkgname=coturn
pkgver=4.5.1.1
pkgrel=1
pkgdesc='Open-source implementation of TURN and STUN server'
arch=(i686 x86_64 armv7h)
url=https://github.com/coturn/coturn
license=(BSD)
depends=(libevent postgresql-libs libmariadbclient hiredis sqlite)
conflicts=(coturn-git)
install=turnserver.install
backup=(etc/turnserver.conf)
source=($url/archive/$pkgver.tar.gz
        turnserver.service
        turnserver.tmpfiles.d)
sha512sums=('a5e1aecdab5a7060ffbc73cc8dd294cafa701f2e0d2a827e40901cb6001af5a2c5ecbafdf14662410713818aad0ad259133f0dc9b34730bf7911863e1e255f70'
            '7259fd6e28c035f93148604dc74021194b78b4432b633b751fab04e416ee47ac5aa4268bac388a84c3fdb73baf41c41e8b75234ae071a96d1cd0ccea6e58e6ea'
            '16810f12ebf75e744f6eaf12ebbb727823de2cc6ffb77fefbbae2021a1699a4ff6627c6171005d84468f391f1722cd4bd092c01431516d065fb4a557cdc1d50a')

build() {
  cd coturn-$pkgver
  ./configure \
    --prefix=/usr \
    --manprefix=/usr/share \
    --examplesdir=/usr/share/turnserver/examples \
    --disable-rpath
  make
}

check() {
  cd coturn-$pkgver
  make check
}

package() {
  install -Dm 644 turnserver.service "$pkgdir"/usr/lib/systemd/system/turnserver.service
  install -Dm 644 turnserver.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/turnserver.conf

  cd coturn-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/coturn

  cd "$pkgdir"

  # Create needed directories
  mkdir -p {etc,var/log/turnserver}

  # Have the config file use more appropriate directories
  mv {usr/etc/turnserver.conf.default,etc/turnserver.conf}
  sed \
    -e '/^#log-file=\/var\/tmp\/turn.log$/c log-file=\/var\/log\/turnserver\/turn.log' \
    -e '/^#pidfile="\/var\/run\/turnserver.pid"$/c pidfile=\/var\/run\/turnserver\/turnserver.pid' \
    -i etc/turnserver.conf
  rmdir usr/etc

  # Remove executable bits from files that erroneously have them
  find {etc,usr/include,usr/lib,usr/share,var} -type f ! -name '*.sh' ! -name '*.pl' -exec chmod 644 {} +
}
