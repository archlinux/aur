# Maintainer: Steven Malis <smmalis37@gmail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrumx
pkgver=1.0.17
pkgrel=1
pkgdesc="Server implementation for the Electrum wallet"
arch=('any')
depends=('leveldb'
         'python'
         'python-aiohttp'
         'python-irc'
         'python-plyvel'
         'python-pylru')
makedepends=('openssl' 'python-setuptools')
optdepends=('bitcoin-core: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client')
url="https://github.com/kyuupichan/electrumx"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/kyuupichan/$pkgname/tar.gz/$pkgver
        'electrumx.conf'
        'electrumx.service')
sha256sums=('31ad831594cdc33087caf82903800c203a0ca440c58d555d7209775b14885616'
            'cf9b54e8841024fe10e35576514e8fc1de4be40e139f8dbc662ef149956f1d44'
            'b4e1a9d4341edf1f2022f8c8591d28ef6bd6db38c6f332445ac294b5fc6dae93')
backup=('etc/electrumx/electrumx.conf'
        'usr/lib/systemd/system/electrumx.service')
install=electrumx.install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership README.rst contrib docs/* \
    "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Making essential directories...'
  install -dm 700 "$pkgdir/etc/electrumx"
  install -dm 755 "$pkgdir/srv/electrumx"

  msg2 'Installing electrumx.conf...'
  install -Dm 600 "$srcdir/electrumx.conf" -t "$pkgdir/etc/electrumx"

  msg2 'Installing electrumx.service...'
  install -Dm 644 "$srcdir/electrumx.service" \
          -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Renaming executables...'
  mv "$pkgdir/usr/bin/electrumx_server.py" "$pkgdir/usr/bin/electrumx-server"
  mv "$pkgdir/usr/bin/electrumx_rpc.py" "$pkgdir/usr/bin/electrumx-rpc"
}
