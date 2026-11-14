# Maintainer: Phillip Dykman <phil.d324@gmail.com>
pkgname=plasmic-cli
# renovate: datasource=npm depName=@plasmicapp/cli
pkgver=0.1.386
pkgrel=1
pkgdesc='Plasmic CLI for syncing local code with Plasmic designs (wraps @plasmicapp/cli)'
arch=('any')
url='https://github.com/plasmicapp/plasmic'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('plasmic')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@plasmicapp/cli/-/cli-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('a7c1d3c04683b782f48bc8c16e172924aa7697f8b02cb014876910b699eca025')

package() {
  npm install -g --no-fund --no-audit --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  # npm leaves build-dir references and wrong ownership behind
  find "$pkgdir/usr" -name package.json -exec sed -i '/"_where"/d' {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@plasmicapp/cli/LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"

  # delivered binary must exist and be executable
  test -x "$pkgdir/usr/bin/plasmic"

  # smoke test: the packaged CLI starts and prints help
  node "$pkgdir/usr/lib/node_modules/@plasmicapp/cli/dist/index.js" --help >/dev/null
}
