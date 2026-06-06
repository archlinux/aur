# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>
# Contributer: Steven Malis <smmalis37@gmail.com>
# Contributer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=electrumx
pkgver=1.20.0
pkgrel=1
pkgdesc="Server implementation for the Electrum wallet"
arch=('any')
depends=('leveldb'
         'python>=3.10'
         'python-aiorpcx-git>=0.25.0' 'python-aiorpcx-git<0.26.0'
         'python-attrs'
         'python-plyvel'
         'python-aiohttp>=3.3.0' 'python-aiohttp<4.0.0'
         'python-websockets'
         )
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pycryptodomex')
optdepends=('bitcoin-daemon: Bitcoin core headless P2P node'
            'electrum: Bitcoin thin client'
            'python-rapidjson<2.0: Alternative JSON parsing library for improved performance'
            'python-ujson<4.0: Alternative JSON parsing library for improved performance')
url="https://github.com/spesmilo/electrumx"
license=('MIT')
conflicts=('electrumx')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/spesmilo/$pkgname/tar.gz/$pkgver
        'electrumx.conf'
        'electrumx.service'
        'electrumx.sysusers')
sha256sums=('4eb7e87b6f72c87d6f4e7fcc3aeada1401d1fce26550d08aa9608baf05523417'
            'ca05f8e8cf01c5074376df75a6691c1aea74cf278244f86ac838900cad9547fb'
            'ece0696dc82e0159d9a266834e6e9e1e518caa68e6f145d262b291e1fc09d67e'
            '761a21723d21348d598be96655e6de4827b2fcff93270895303e82670e0532f1')
backup=('etc/electrumx/electrumx.conf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  local site_packages
  site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  python -m installer --destdir="$PWD/tmp_install" dist/*.whl

  # Plugin: deselect tests for coins whose optional hash libraries are not
  # packaged in the official repos and are not dependencies of this package.
  # Filtering by coin name is portable; positional --deselect indices are not,
  # because the suite parametrizes via os.listdir() (filesystem-ordered).
  cat > "$PWD/arch_skip_optional.py" <<'EOF'
# Coins requiring hash modules not in the official repos:
#   blake256        -> Decred / DecredTestnet
#   groestlcoin_hash-> Groestlcoin
_SKIP_COINS = {"Decred", "DecredTestnet", "Groestlcoin"}

def _coin_of(item):
    spec = getattr(item, "callspec", None)
    if spec is None:
        return None
    for val in spec.params.values():
        if isinstance(val, tuple) and val and hasattr(val[0], "__name__"):
            return val[0].__name__
    return None

def pytest_collection_modifyitems(config, items):
    keep, drop = [], []
    for item in items:
        (drop if _coin_of(item) in _SKIP_COINS else keep).append(item)
    if drop:
        config.hook.pytest_deselected(items=drop)
        items[:] = keep
EOF

  PYTHONPATH="$PWD/tmp_install/$site_packages:$PWD" \
  PATH="$PWD/tmp_install/usr/bin:$PATH" \
    python -m pytest tests \
      -p arch_skip_optional \
      --ignore=tests/server/test_storage.py
}

package() {
  install -D -m 644 "$srcdir/electrumx.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"

  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership README.md contrib docs/* "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 600 "$srcdir/electrumx.conf" -t "$pkgdir/etc/electrumx"

  install -Dm 644 "$srcdir/electrumx.service" -t "$pkgdir/usr/lib/systemd/system"

  python -m installer --destdir="$pkgdir" dist/*.whl

  mv "$pkgdir/usr/bin/electrumx_server" "$pkgdir/usr/bin/electrumx-server"
  mv "$pkgdir/usr/bin/electrumx_rpc" "$pkgdir/usr/bin/electrumx-rpc"
  mv "$pkgdir/usr/bin/electrumx_compact_history" "$pkgdir/usr/bin/electrumx-compact-history"
}
