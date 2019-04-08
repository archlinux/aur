# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: MoeRT09 <https://aur.archlinux.org/account/MoeRT09>
# Contributor: jlkon13 <internet@devpi.de>

pkgname=coturn
pkgver=4.5.1.1
pkgrel=2
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
        turnserver.sysusers.d
        turnserver.tmpfiles.d)
sha512sums=('a5e1aecdab5a7060ffbc73cc8dd294cafa701f2e0d2a827e40901cb6001af5a2c5ecbafdf14662410713818aad0ad259133f0dc9b34730bf7911863e1e255f70'
            '67d623820c69de86c5831e3daa0172b4ca77278ed138dd55e6775590b89f5293f380adc338a330e26d2eaf0e8dbbc20c0bbf469aca272bae99973386c72aef30'
            '69a8aafaef369ff76043ff9e3b8deef0621ac8db647fa5c044bade30fe6f63b8cc79d2ecedacb83f31e7005cea8ee49dc37b55c2f21eed11c5d1a2b7ca5e68a5'
            'd668df15a81a2bb0bb38ebbf367b7ed3db66a17ebadd5fe5bea9b343fbd992d9ada2d146d945f78fc4b2bf103aaa2407a30f270d01919be540b427221de15741')

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
  install -Dm 644 turnserver.sysusers.d "$pkgdir"/usr/lib/sysusers.d/turnserver.conf
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
