# Maintainer: Steven Malis <smmalis37@gmail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrumx
pkgver=1.12.0
pkgrel=1
pkgdesc="Server implementation for the Electrum wallet"
arch=('any')
depends=('leveldb'
         'python>=3.6'
         'python-aiorpcx>=0.18.1' 'python-aiorpcx<0.19.0'
         'python-attrs'
         'python-plyvel'
         'python-pylru'
         'python-aiohttp>=3.3.0'
         )
makedepends=('python-setuptools')
optdepends=('bitcoin-daemon: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client')
url="https://github.com/kyuupichan/electrumx"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/kyuupichan/$pkgname/tar.gz/$pkgver
        'electrumx.conf'
        'electrumx.service'
        'electrumx.sysusers')
sha256sums=('a27e8f503feaaad17f8ce7ab13bb33428a468b6beb13e041706a069f541364f8'
            '5977f369d4a07024bcbd305c02e2130bba42fd93913224c4cd0f8f41525ad0ef'
            'ece0696dc82e0159d9a266834e6e9e1e518caa68e6f145d262b291e1fc09d67e'
            '761a21723d21348d598be96655e6de4827b2fcff93270895303e82670e0532f1')
backup=('etc/electrumx/electrumx.conf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  install -D -m 644 "$srcdir/electrumx.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership README.rst contrib docs/* "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 600 "$srcdir/electrumx.conf" -t "$pkgdir/etc/electrumx"

  install -Dm 644 "$srcdir/electrumx.service" -t "$pkgdir/usr/lib/systemd/system"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mv "$pkgdir/usr/bin/electrumx_server" "$pkgdir/usr/bin/electrumx-server"
  mv "$pkgdir/usr/bin/electrumx_rpc" "$pkgdir/usr/bin/electrumx-rpc"
  mv "$pkgdir/usr/bin/electrumx_compact_history" "$pkgdir/usr/bin/electrumx-compact-history"
}
