# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=raspisump
pkgver=2.0.4
pkgrel=1
pkgdesc="Sump pit water level monitoring system for the Raspberry Pi"
arch=('any')
url="https://www.linuxnorth.org/raspi-sump/"
license=('Apache-2.0')
depends=(
  'python'
  'python-flask'
  'python-waitress'
  'python-argon2-cffi'
  'python-mastodon-py'
  'python-pinsource'
  'nginx'
  'openssl'
)
optdepends=(
  'sqlite: inspect/repair the raspisump.db database from the command line'
  'sudo: control raspisump/rsumpweb services from the web admin panel'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
backup=('etc/nginx/sites-available/raspi-sump'
        'etc/sudoers.d/raspisump-web'
        'etc/raspi-sump/raspisump.conf'
        'etc/raspi-sump/credentials.conf')
install=raspisump.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/alaudet/raspi-sump/archive/refs/tags/v$pkgver.tar.gz"
        'raspisump.sysusers'
        'raspisump.tmpfiles'
        60-gpiochips.rules
        0001-fix.patch
      )
sha256sums=('7593bb0cc9da93276245b39df1a4e2ac938e074b2059eaabdc3cb5e80ecdf9b8'
            'bcf6c728795e696d5d8834de0c27580bd4eedcb86cb0a67eda5fd5fd5f8ef08a'
            'a33537303aed0080411c0a5860b1782c88372dbda9b06dfc9c7a5ca14d5e83b7'
            '6ceae2aa160f8f591935a17dd4b33f3dfc4b5d8defa15a1d89595a880046030a'
            '0ec94b0e98411f723d40737742da5044411cf4382b7ddac949b13b46af603abb')

prepare() {
  cd "raspi-sump-$pkgver"
  patch -p1 -i ../0001-fix.patch
}

build() {
  cd "raspi-sump-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "raspi-sump-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # sysusers.d / tmpfiles.d - Arch equivalents of the user creation and
  # StateDirectory-adjacent mkdir/chown/chmod work Debian's postinst does
  # by hand.
  install -Dm644 "$srcdir/raspisump.sysusers" "$pkgdir/usr/lib/sysusers.d/raspisump.conf"
  install -Dm644 "$srcdir/raspisump.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/raspisump.conf"

  # systemd units
  install -Dm644 conf/systemd/raspisump.service "$pkgdir/usr/lib/systemd/system/raspisump.service"
  install -Dm644 conf/systemd/rsumpweb.service "$pkgdir/usr/lib/systemd/system/rsumpweb.service"

  install -Dm440 conf/sudoers/raspisump-web "$pkgdir/etc/sudoers.d/raspisump-web"

  install -Dm644 conf/raspisump.conf "$pkgdir/etc/raspi-sump/raspisump.conf"
  install -Dm640 conf/credentials.conf "$pkgdir/etc/raspi-sump/credentials.conf"

  # nginx vhost - shipped for reference and to be symlinked from sites-enabled/ manually
  install -Dm644 conf/nginx/raspi-sump "$pkgdir/etc/nginx/sites-available/raspi-sump"
  install -dm755 "$pkgdir/etc/nginx/sites-enabled"

  # Static web assets served directly by nginx (see the `location /static/`
  # block in the vhost above) rather than proxied through Flask.
  install -d "$pkgdir/usr/share/raspi-sump"
  cp -r conf/web "$pkgdir/usr/share/raspi-sump/web"
  install -d "$pkgdir/usr/share/raspi-sump/web/static"
  cp -r raspisump/static/. "$pkgdir/usr/share/raspi-sump/web/static/"

  # udev rule
  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -Dm0644 60-gpiochips.rules "$pkgdir/usr/lib/udev/rules.d/60-gpiochips.rules"

  # Version footer string. $pkgver is already known at build time, so this
  # is written once here instead of shelling out to `pacman -Q` at
  # post_install time.
  echo "Raspisump Version $pkgver | Copyright 2026 Al Audet" \
    > "$pkgdir/usr/share/raspi-sump/web/css/inc/VERSION"
}
