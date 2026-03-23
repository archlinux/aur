# Maintainer: dmitrysvd
# This PKGBUILD was generated with the assistance of AI.
pkgname=defuddle
pkgver=0.14.0
pkgrel=1
pkgdesc="Extract article content and metadata from web pages"
arch=('any')
url="https://github.com/kepano/defuddle"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=('linkedom: for node/cli support'
            'mathml-to-latex: for math conversion'
            'temml: for math conversion'
            'turndown: for markdown output')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('69dd7ef65a2c7cf2b99388f720cac39bfc258277c96ce5f17985ee19d545f241')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install into /usr/lib/node_modules/
  install -dm755 "$pkgdir/usr/lib/node_modules/$pkgname"
  cp -r . "$pkgdir/usr/lib/node_modules/$pkgname"

  # Prune development dependencies
  cd "$pkgdir/usr/lib/node_modules/$pkgname"
  npm prune --production

  # Remove empty directories left by npm prune
  find . -type d -empty -delete

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir/usr" -type f -exec chmod 644 {} +

  # Make the CLI binary executable and link it to /usr/bin
  chmod +x "$pkgdir/usr/lib/node_modules/$pkgname/dist/cli.js"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/node_modules/$pkgname/dist/cli.js" "$pkgdir/usr/bin/$pkgname"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
