# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=coturn-git
pkgver=4.5.2+r120+g3865842
pkgrel=1
pkgdesc='Open-source implementation of TURN and STUN server (git)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/coturn/coturn"
license=(BSD)
depends=(libevent postgresql-libs libmariadbclient hiredis sqlite)
makedepends=(git)
provides=(coturn)
conflicts=(coturn)
backup=(etc/turnserver/turnserver.conf)
source=(git+https://github.com/coturn/coturn.git
        turnserver.service
        turnserver.sysusers.d
        turnserver.tmpfiles.d)
sha256sums=('SKIP'
            '32d0ef62663bcbda0b5c7d324d156ce83605861c3ce63536bc57b5f0e5ba6f5c'
            '92e51ecd664ab53031baa0aeee615fa7c4e73f79c5a3ebc49ac8e0919e4d23fd'
            'd765d14ff3a6527498257e4dc9e76231742cd41d8fe658004e171b8937db6a75')

pkgver() {
  cd ${srcdir}/coturn
  git describe --tags --exclude '*/*' | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd ${srcdir}/coturn
  ./configure \
    --prefix=/usr \
    --manprefix=/usr/share \
    --examplesdir=/usr/share/turnserver/examples \
    --disable-rpath
  make
}

check() {
  cd ${srcdir}/coturn
  make check
}

package() {
  install -Dm 644 turnserver.service -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 turnserver.sysusers.d "$pkgdir"/usr/lib/sysusers.d/turnserver.conf
  install -Dm 644 turnserver.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/turnserver.conf

  cd ${srcdir}/coturn

  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/coturn

  cd "$pkgdir"

  # Create needed directories
  install -dm 700 "$pkgdir"/etc/turnserver

  # Use Arch-specific directories in config
  mv {usr/etc/turnserver.conf.default,etc/turnserver/turnserver.conf}
  sed \
    -e '/^#log-file=\/var\/tmp\/turn.log$/c log-file=\/var\/log\/turnserver\/turn.log' \
    -e '/^#pidfile="\/var\/run\/turnserver.pid"$/c pidfile=\/var\/run\/turnserver\/turnserver.pid' \
    -i etc/turnserver/turnserver.conf
  rmdir usr/etc

  # Remove unneeded executable bits
  find {etc,usr/include,usr/lib,usr/share,var} -type f ! -name '*.sh' ! -name '*.pl' -exec chmod 644 {} +
}
