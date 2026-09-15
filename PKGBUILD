# Maintainer: Jeremy MountainJohnson <jay@jskier.com>
pkgname=jotbird-cli
_npmname=jotbird
pkgver=0.4.1
pkgrel=1
pkgdesc='Publish Markdown from the command line with JotBird'
arch=('any')
url='https://www.jotbird.com/cli'
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
optdepends=('xdg-utils: open the browser for jotbird login')
provides=("$_npmname")
conflicts=("$_npmname")
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('889269ae7e530a0094ff596e95bc53b177b5233401d88ef4b1ead6d6cdae50c5')

package() {
  npm install -g --no-audit --no-fund --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  # npm installs global packages with the build user's ownership
  chown -R root:root "$pkgdir"

  # Remove references to $pkgdir from package.json
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
