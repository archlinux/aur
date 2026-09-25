# Maintainer: phil.d324@gmail.com <H3mul>
pkgname=claude-mem
# renovate: datasource=npm depName=claude-mem
pkgver=13.25.3
pkgrel=1
pkgdesc='Memory compression system for Claude Code - persist context across sessions'
arch=('any')
url='https://github.com/thedotmack/claude-mem'
license=('Apache-2.0')
depends=('nodejs>=20.12.0' 'bun')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
        claude-mem-worker.service)
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('02c22b3ebf06af88c8f1de80dc4e8bec05db977e176ba7243eccfeb358c4e615'
            'aa9e319949c5aaf754e80a06ea41704309ffad7f11a9cdc5c476dc1ed02fae70')

package() {
  npm install -g --no-fund --no-audit --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # npm leaves build-dir references and wrong ownership behind
  find "$pkgdir/usr" -name package.json -exec sed -i '/"_where"/d' {} +
  chown -R root:root "$pkgdir"

  install -Dm644 claude-mem-worker.service -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
