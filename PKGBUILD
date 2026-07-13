# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=raspi-sump
pkgver=2.0.4
pkgrel=7
_commit=cdcac05b58a1d8820bd87271fdf7977f45e32c28
_srcname=$pkgname-$_commit
pkgdesc="Sump pit water level monitoring system for the Raspberry Pi"
arch=(any)
url="https://github.com/graysky2/raspi-sump"
license=(Apache-2.0)
conflicts=("${pkgname/-}")
depends=(
  python-flask
  python-waitress
  python-argon2-cffi
  python-mastodon-py
  python-pinsource
  openssl
)
optdepends=(
  'caddy: serve up https for raspi-pump'
  'nginx: upstream default server works out-of-the-box'
  'polkit: control raspisump/rsumpweb services from the web admin panel'
  'sqlite: inspect/repair the raspisump.db database from the command line'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=(etc/nginx/sites-available/raspi-sump
        etc/systemd/journald@raspisump.conf
        etc/raspi-sump/raspisump.conf
        etc/raspi-sump/credentials.conf)
install=raspi-sump.install
source=("$pkgname-${_commit:0:10}.tar.gz::https://github.com/graysky2/raspi-sump/archive/$_commit.tar.gz"
        $pkgname.sysusers
        $pkgname.tmpfiles
      )
sha256sums=('d5a097881b23087fb108949224565bd803079a8e67668660b83ecaefd4c58d54'
            '2a1c98aa86db079d4f8d36a32d7577f8aea0e5e24c1676e8f7a1fdc500ea645f'
            '8fbf8f9725d42928e4fd9626426da5338324cd87d6a9b2a967193f6a47790f01')

build() {
  cd "$pkgname-$_commit"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$_commit"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 conf/systemd/raspisump.service "$pkgdir/usr/lib/systemd/system/raspisump.service"
  install -Dm644 conf/systemd/rsumpweb.service "$pkgdir/usr/lib/systemd/system/rsumpweb.service"
  install -Dm644 conf/systemd/journald@raspisump.conf \
    "$pkgdir/etc/systemd/journald@raspisump.conf"
  install -Dm644 conf/systemd/systemd-journald@raspisump.service.d/raspisump-acl.conf \
    "$pkgdir/usr/lib/systemd/system/systemd-journald@raspisump.service.d/raspisump-acl.conf"

  install -Dm644 conf/polkit/49-raspisump.rules \
    "$pkgdir/usr/share/polkit-1/rules.d/49-raspisump.rules"

  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -Dm0644 conf/udev/60-gpiochips.rules "$pkgdir/usr/lib/udev/rules.d/60-gpiochips.rules"

  install -Dm644 conf/raspisump.conf "$pkgdir/etc/raspi-sump/raspisump.conf"
  install -Dm640 conf/credentials.conf "$pkgdir/etc/raspi-sump/credentials.conf"

  install -Dm644 conf/nginx/raspi-sump "$pkgdir/etc/nginx/sites-available/raspi-sump"
  install -dm755 "$pkgdir/etc/nginx/sites-enabled"

  install -d "$pkgdir/usr/share/raspi-sump"
  install -d "$pkgdir/usr/share/raspi-sump/web/static"
  cp -r conf/web "$pkgdir/usr/share/raspi-sump/web"
  cp -r raspisump/static/. "$pkgdir/usr/share/raspi-sump/web/static/"
}
