# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrumx
pkgver=1.0.11
pkgrel=1
pkgdesc="Server implementation for the Electrum wallet"
arch=('any')
depends=('leveldb'
         'python'
         'python-aiohttp'
         'python-irc'
         'python-plyvel'
         'python-pylru')
makedepends=('expect' 'openssl' 'python-setuptools')
optdepends=('bitcoin-core: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client')
url="https://github.com/kyuupichan/electrumx"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/kyuupichan/$pkgname/tar.gz/$pkgver
        'electrumx.conf'
        'electrumx.service')
sha256sums=('9e43399daf42115d50299d578d19a2565645ce815c3bd9c3851d8b4e027e9256'
            '6134f8e333fc622bea781ed334b738ade39bf7a6e4ace3704cba2e22788a4bf3'
            'a70e6d2ff4e0eb8125ba2d52bcdaec96129068363e365d48a47961f47b9fc554')
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
