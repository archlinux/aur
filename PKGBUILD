# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=postfix-mta-sts-resolver
pkgver=1.3.0
pkgrel=1
pkgdesc="Daemon for MTA-STS policy enforcement for postfix"
arch=('any')
url="https://github.com/Snawoot/postfix-mta-sts-resolver"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-aiodns' 'python-yaml'
         'python-pynetstring' 'python-sdnotify')
makedepends=('python-pip')
optdepends=('python-uvloop: For faster event loop handling'
            'python-aioredis: For redis cache support'
            'python-aiosqlite: For sqlite cache support')
source=("https://github.com/Snawoot/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
        "mta-sts-daemon.service"
        "mta-sts-daemon-sysusers.conf")
sha256sums=('311c8e0c64367b1747404c37eccf600176066ce4d62962cc79cb9bd3f46fc8a2'
            'SKIP'
            'bfc1b2c171ffae6af607ffbd9e8e913452c50073b298a16f6f1cda74f74c6b9c'
            '8e7281deebdf71b4ffd63a2e265fd818459042004a36ca2e7284868cc182dcd5')
validpgpkeys=('8EE97E32515D051898B1864AF6C5633BE5DE7127')
backup=(etc/mta-sts-daemon.yml)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d -m0755 "$pkgdir/etc/postfix/"
  install -m0644 config_examples/mta-sts-daemon.yml.internal \
          "$pkgdir/etc/mta-sts-daemon.yml"
  install -d -m0755 "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.redis \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.sqlite \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.sqlite_unixsock \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -d -m0755 "$pkgdir/usr/lib/sysusers.d/"
  install -m0644 "$srcdir/mta-sts-daemon-sysusers.conf" \
          "$pkgdir/usr/lib/sysusers.d/mta-sts-daemon.conf"
  install -d -m0755 "$pkgdir/usr/lib/systemd/system/"
  install -m0644 "$srcdir/mta-sts-daemon.service" \
          "$pkgdir/usr/lib/systemd/system/mta-sts-daemon.service"
}
