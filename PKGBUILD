# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=mongosh
pkgver=1.8.0
pkgrel=1
pkgdesc='Node.js REPL for interacting with MongoDB instances.'
arch=('x86_64')
url='https://docs.mongodb.com/mongodb-shell/'
license=('Apache')
depends=(nodejs krb5 libuv)
makedepends=(git jq npm modclean)
source=(
  https://github.com/mongodb-js/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  mongosh.sh
)
sha256sums=('2e10111950049345fd3c14148b94241a864f1f8ee85bb39054df808ab0900944'
            '2238131962a4d5a60003edb356c02dddb6335179bf9d8b34a851bffed53e4e57')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  jq '.workspaces = ["packages/*"]' package.json > temp.json
  mv temp.json package.json
  jq '.useWorkspaces = true' lerna.json > temp.json
  mv temp.json lerna.json
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
  npm install --build-from-source
  npm run compile-cli
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm0755 ../mongosh.sh "$pkgdir"/usr/bin/mongosh
  install -dm0755 "$pkgdir"/usr/lib/node_modules/mongosh
  cp -a packages node_modules package*.json "$pkgdir"/usr/lib/node_modules/mongosh

  cd "$pkgdir"/usr/lib/node_modules/mongosh
  npm prune --omit=dev
  modclean --path . -r -a "*.ts,.bin,.deps,.github,.vscode,bin.js" --ignore='license'
  cd -

  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
