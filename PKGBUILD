# Maintainer: Steven Malis <smmalis37@gmail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrumx
pkgver=1.9.5
pkgrel=1
pkgdesc="Server implementation for the Electrum wallet"
arch=('any')
depends=('leveldb'
         'python>=3.6'
         'python-aiohttp>=2.0.0'
         'python-plyvel'
         'python-pylru'
         'python-aiorpcx>=0.10.4')
makedepends=('python-setuptools')
optdepends=('bitcoin-daemon: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client')
url="https://github.com/kyuupichan/electrumx"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/kyuupichan/$pkgname/tar.gz/$pkgver
        'electrumx.conf'
        'electrumx.service')
sha256sums=('cb327e99bf20db364299012b0c85ff0a697f6fdae60f8f198743640333989e31'
            'f13119ac93e6e05203f9d5dae5e737ec718ca5c829b0b6b73b0761587ae651b7'
            'ece0696dc82e0159d9a266834e6e9e1e518caa68e6f145d262b291e1fc09d67e')
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
  cp -dpr --no-preserve=ownership README.rst contrib docs/* "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Making essential directories...'
  install -dm 700 "$pkgdir/etc/electrumx"
  install -dm 755 "$pkgdir/srv/electrumx"

  msg2 'Installing electrumx.conf...'
  install -Dm 600 "$srcdir/electrumx.conf" -t "$pkgdir/etc/electrumx"

  msg2 'Installing electrumx.service...'
  install -Dm 644 "$srcdir/electrumx.service" -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  msg2 'Renaming executables...'
  mv "$pkgdir/usr/bin/electrumx_server" "$pkgdir/usr/bin/electrumx-server"
  mv "$pkgdir/usr/bin/electrumx_rpc" "$pkgdir/usr/bin/electrumx-rpc"
  mv "$pkgdir/usr/bin/electrumx_compact_history" "$pkgdir/usr/bin/electrumx-compact-history"
}
