# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=coturn-git
pkgver=4.5.1.1+20+ge0d84e1
pkgrel=2
pkgdesc='Open-source implementation of TURN and STUN server (git)'
arch=(i686 x86_64 armv7h)
url=https://github.com/coturn/coturn
license=(BSD)
depends=(libevent postgresql-libs libmariadbclient hiredis sqlite)
provides=(coturn)
conflicts=(coturn)
install=turnserver.install
backup=(etc/turnserver/turnserver.conf)
source=(git+$url
        turnserver.service
        turnserver.sysusers.d
        turnserver.tmpfiles.d)
sha512sums=('SKIP'
            '47af7bbf28f8a5fc674b90d1370026405ccb43623f05e47cf915c594e7e35865f4dce64d2b3001bc609a843a54661d1a1172790153f0b8ba9186db48c42b0024'
            '32596f741e561c707f69c1ea90adf75c83742906d33c50e1fa5ec0899eeb607d96a48c36fcbb6facb62947beedcace9f6c3fb748c4d67f058bf3f72413766f82'
            '1d47fd988c36e443aa723d048072eb8be8bb59c2845eb1bbd47eae7d955b6bbda7e5526e00f6ee2f54c5121657413058011aa4c130214a83b9f396a35fb45888')

pkgver() {
  cd coturn
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd coturn
  ./configure \
    --prefix=/usr \
    --manprefix=/usr/share \
    --examplesdir=/usr/share/turnserver/examples \
    --disable-rpath
  make
}

check() {
  cd coturn
  make check
}

package() {
  install -Dm 644 turnserver.service "$pkgdir"/usr/lib/systemd/system/turnserver.service
  install -Dm 644 turnserver.sysusers.d "$pkgdir"/usr/lib/sysusers.d/turnserver.conf
  install -Dm 644 turnserver.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/turnserver.conf

  cd coturn

  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/coturn

  cd "$pkgdir"

  # Create needed directories
  mkdir -p {etc/turnserver,var/log/turnserver}

  # Have the config file use more appropriate directories
  mv {usr/etc/turnserver.conf.default,etc/turnserver/turnserver.conf}
  sed \
    -e '/^#log-file=\/var\/tmp\/turn.log$/c log-file=\/var\/log\/turnserver\/turn.log' \
    -e '/^#pidfile="\/var\/run\/turnserver.pid"$/c pidfile=\/var\/run\/turnserver\/turnserver.pid' \
    -i etc/turnserver/turnserver.conf
  rmdir usr/etc

  # Remove executable bits from files that erroneously have them
  find {etc,usr/include,usr/lib,usr/share,var} -type f ! -name '*.sh' ! -name '*.pl' -exec chmod 644 {} +
}
