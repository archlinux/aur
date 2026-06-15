# Maintainer: dmitrysvd
# This PKGBUILD was generated with the assistance of AI.
pkgname=defuddle
pkgver=0.18.1
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
sha256sums=('613c5149fb9758a870db5de26f354a43d271e3366dc111da4431bd750bd68313')

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
