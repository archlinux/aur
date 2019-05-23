# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>
pkgname=postfix-mta-sts-resolver
pkgver=0.4.5
pkgrel=2
pkgdesc="Daemon for MTA-STS policy enforcement for postfix"
arch=('any')
url="https://github.com/Snawoot/postfix-mta-sts-resolver"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-aiodns' 'python-pyaml'
         'python-pynetstring' 'python-sdnotify')
makedepends=('python-pip')
optdepends=('python-uvloop: For faster event loop handling'
            'python-aioredis: For Redis cache support'
            'python-aiosqlite: For sqlite cache support')
source=("https://github.com/Snawoot/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.asc}
       "fix-optdepends.patch")
sha256sums=('0551b733985cb7f9682ba03567e4cee8729d4b2651c5ab22410640d51c0bb07c'
            'SKIP'
            'ec70751d4ed581727c2f4b2736b87ae44bfffd72d508f6135e08c715845fa1ad')
validpgpkeys=('8EE97E32515D051898B1864AF6C5633BE5DE7127')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/fix-optdepends.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -d -m0755 "$pkgdir/etc/postfix/"
  install -m0644 config_examples/mta-sts-daemon.yml.internal \
          "$pkgdir/etc/postfix/mta-sts-daemon.yml"
  install -d -m0755 "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.redis \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
  install -m0644 config_examples/mta-sts-daemon.yml.sqlite \
          "$pkgdir/usr/share/doc/postfix-mta-sts-resolver/"
}
