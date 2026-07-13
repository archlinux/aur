# Maintainer: graysky <therealgraysky AT proton DOT me>

pkgname=raspi-sump
pkgver=2.0.4
pkgrel=5
pkgdesc="Sump pit water level monitoring system for the Raspberry Pi"
arch=(any)
url="https://www.linuxnorth.org/raspi-sump/"
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/alaudet/raspi-sump/archive/refs/tags/v$pkgver.tar.gz"
        $pkgname.sysusers
        $pkgname.tmpfiles
        60-gpiochips.rules
        0001-fix-init-schema-on-path-to-prevent-500-error-on-fresh-installs.patch
        0002-Add-12h-24h-time-format-setting-for-chart-x-axis.patch
        0003-Isolate-service-logs-in-a-dedicated-journal-namespac.patch
        0004-Replace-sudo-with-a-scoped-polkit-rule-for-service-c.patch
        0005-Log-unit-start-stop-markers-into-the-raspisump-journ.patch
        0006-Add-web-UI-favicon.patch
      )
sha256sums=('7593bb0cc9da93276245b39df1a4e2ac938e074b2059eaabdc3cb5e80ecdf9b8'
            'af7e3e103a5677139b560aad5a15854e160d333b267f7a4416bb6de9e1eec424'
            'a33537303aed0080411c0a5860b1782c88372dbda9b06dfc9c7a5ca14d5e83b7'
            '6ceae2aa160f8f591935a17dd4b33f3dfc4b5d8defa15a1d89595a880046030a'
            '11913d44482a95e5b7b25ab7f97537897f36e44fd2bb3fe347939fad53986efc'
            'a166a2c8ef227f594019418a7e926ab383da842dd3341934d9a50292aef47f76'
            'd9536876b4a630f3359032aae7ad32da314f1a2aa07d096c52148f070d6d6139'
            '6fdbd032e145fdef1b2cb517e3f8e988b7937ac7b561fb6db714150bd227a21b'
            '255abfa5342188190e9a4a2b3307001b87436093167548354e6511d3b3fb8ae4'
            '9a36931e22e980f3313058cd9c9d4663c365abb2a246870c08d3dae934d5a67d')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i ../0001-fix-init-schema-on-path-to-prevent-500-error-on-fresh-installs.patch
  patch -p1 -i ../0002-Add-12h-24h-time-format-setting-for-chart-x-axis.patch
  patch -p1 -i ../0003-Isolate-service-logs-in-a-dedicated-journal-namespac.patch
  patch -p1 -i ../0004-Replace-sudo-with-a-scoped-polkit-rule-for-service-c.patch
  patch -p1 -i ../0005-Log-unit-start-stop-markers-into-the-raspisump-journ.patch
  patch -p1 -i ../0006-Add-web-UI-favicon.patch
}

build() {
  cd "raspi-sump-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "raspi-sump-$pkgver"

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
  install -Dm0644 "$srcdir"/60-gpiochips.rules "$pkgdir/usr/lib/udev/rules.d/60-gpiochips.rules"

  install -Dm644 conf/raspisump.conf "$pkgdir/etc/raspi-sump/raspisump.conf"
  install -Dm640 conf/credentials.conf "$pkgdir/etc/raspi-sump/credentials.conf"

  install -Dm644 conf/nginx/raspi-sump "$pkgdir/etc/nginx/sites-available/raspi-sump"
  install -dm755 "$pkgdir/etc/nginx/sites-enabled"

  install -d "$pkgdir/usr/share/raspi-sump"
  install -d "$pkgdir/usr/share/raspi-sump/web/static"
  cp -r conf/web "$pkgdir/usr/share/raspi-sump/web"
  cp -r raspisump/static/. "$pkgdir/usr/share/raspi-sump/web/static/"
}
