# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Steven Malis <smmalis37@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrumx-git
_pkgname=electrumx
pkgver=1.16.0.r2025.0e321d2
pkgrel=1
pkgdesc="Server implementation for the Electrum wallet (git version)"
arch=('any')
depends=('leveldb'
         'python>=3.7'
         'python-aiorpcx>=0.18.5' 'python-aiorpcx<0.19.0'
         'python-attrs'
         'python-plyvel'
         'python-pylru'
         'python-aiohttp>=3.3.0' 'python-aiohttp<4.0.0'
         'python-websockets'
         )
makedepends=('python-setuptools' 'git')
optdepends=('bitcoin-daemon: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client'
            'python-rapidjson<2.0: Alternative JSON parsing library for improved performance'
            'python-ujson<4.0: Alternative JSON parsing library for improved performance'
            )
url="https://github.com/spesmilo/electrumx"
license=('MIT')
conflicts=('electrumx')
source=(git+https://github.com/spesmilo/$_pkgname.git
        'electrumx.conf'
        'electrumx.service'
        'electrumx.sysusers')
sha256sums=('SKIP'
            'ca05f8e8cf01c5074376df75a6691c1aea74cf278244f86ac838900cad9547fb'
            'ece0696dc82e0159d9a266834e6e9e1e518caa68e6f145d262b291e1fc09d67e'
            '761a21723d21348d598be96655e6de4827b2fcff93270895303e82670e0532f1')
backup=('etc/electrumx/electrumx.conf')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "$(git for-each-ref refs/tags --sort=-creatordate --format='%(refname:short)' --count=1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  install -D -m 644 "$srcdir/electrumx.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

  cd "$srcdir/$_pkgname"

  install -Dm 644 LICENCE -t "$pkgdir/usr/share/licenses/$_pkgname"

  install -dm 755 "$pkgdir/usr/share/doc/$_pkgname"
  cp -dpr --no-preserve=ownership README.rst contrib docs/* "$pkgdir/usr/share/doc/$_pkgname"

  install -Dm 600 "$srcdir/electrumx.conf" -t "$pkgdir/etc/electrumx"

  install -Dm 644 "$srcdir/electrumx.service" -t "$pkgdir/usr/lib/systemd/system"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  mv "$pkgdir/usr/bin/electrumx_server" "$pkgdir/usr/bin/electrumx-server"
  mv "$pkgdir/usr/bin/electrumx_rpc" "$pkgdir/usr/bin/electrumx-rpc"
  mv "$pkgdir/usr/bin/electrumx_compact_history" "$pkgdir/usr/bin/electrumx-compact-history"
}
