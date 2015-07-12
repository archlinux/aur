# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=insight-bitcore
pkgver=0.2.7
pkgrel=1
pkgdesc="Bitcoin blockchain explorer with complete REST and websocket APIs"
arch=('i686' 'x86_64')
depends=('leveldb' 'nodejs')
makedepends=('git' 'nodejs-bower' 'nodejs-grunt-cli' 'npm' 'python2')
optdepends=('bitcoin-core: Bitcoin core headless P2P node')
url="https://insight.is"
license=('MIT')
source=(${pkgname%-bitcore}.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        insight.conf
        insight.service)
sha256sums=('3269653cfcae3a0d0c44603b1ac2d7fa320eee563c5dfea1d07427d0b56b7161'
            'ba78afbd00a873a0447a78c2661d5ea64137648c92a9d7b4f8d88817453e9283'
            'e39b630e18423dbb1868438814e7ac5e31e0b3908df97891b418083941adccb7')
options=('!strip')
install=insight.install

build() {
  cd "$srcdir/package"

  msg2 'Fetching NPM dependencies...'
  npm install --python=python2

  msg2 'Fetching Web assets...'
  bower install --allow-root --config.interactive=false

  msg2 'Compiling Web assets...'
  grunt compile
}

package() {
  cd "$srcdir/package"

  msg2 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/insight/README.md"

  msg2 'Installing...'
  install -dm 700 "$pkgdir/usr/share/insight/db"
  find . -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/insight" \;

  msg2 'Installing insight.conf...'
  install -Dm 600 "$srcdir/insight.conf" "$pkgdir/etc/conf.d/insight"

  msg2 'Installing insight.service...'
  install -Dm 644 "$srcdir/insight.service" "$pkgdir/usr/lib/systemd/system/insight.service"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
