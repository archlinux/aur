# Maintainer: Phillip Dykman <phil.d324@gmail.com>
pkgname=claude-mem-sync
# renovate: datasource=github-releases depName=lopadova/claude-mem-sync
pkgver=1.2.0
pkgrel=1
pkgdesc='Team memory sharing for claude-mem - sync AI memories across developers (wraps @lopadova/claude-mem-sync)'
arch=('any')
url='https://github.com/lopadova/claude-mem-sync'
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a78b1924183ab78041c79234fdb627718a7bb3a00b754e19a45940ecbdcd89ef')

build() {
  cd "$pkgname-$pkgver"
  # dist/ is not committed upstream; the npm package is only on GitHub Packages (auth required)
  npm install --no-fund --no-audit --ignore-scripts --cache "$srcdir/npm-cache"
  npm run build
  npm pack --ignore-scripts --pack-destination "$srcdir"
}

package() {
  npm install -g --omit=optional --no-fund --no-audit --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" "$srcdir/lopadova-claude-mem-sync-"*.tgz

  find "$pkgdir/usr" -name package.json -exec sed -i '/"_where"/d' {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

  test -x "$pkgdir/usr/bin/mem-sync"

  # smoke test: the packaged entrypoint starts and prints help
  "$pkgdir/usr/bin/mem-sync" --help >/dev/null
}
