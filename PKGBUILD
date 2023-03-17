# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=mongosh
pkgver=1.8.0
pkgrel=4
pkgdesc='Rich Node.js REPL for interacting with MongoDB instances.'
arch=('x86_64')
url='https://github.com/mongodb-js/mongosh'
license=('Apache')
depends=(nodejs krb5)
makedepends=(git jq npm modclean libmongocrypt)
optdepends=('libmongocrypt: session encryption support')
source=(
  https://github.com/mongodb-js/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  mongosh.js
)
sha256sums=('2e10111950049345fd3c14148b94241a864f1f8ee85bb39054df808ab0900944'
            '59387e21725568e848bd6da24cd5a8dcd00c7725e0fa99dcfdcfaf677c075e8c')

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

  install -Dm0755 "$srcdir"/mongosh.js "$pkgdir"/usr/bin/mongosh
  install -dm0755 "$pkgdir"/usr/lib/node_modules/mongosh
  cp -a packages node_modules package*.json "$pkgdir"/usr/lib/node_modules/mongosh

  cd "$pkgdir"/usr/lib/node_modules/mongosh
  npm prune --omit=dev
  modclean --path . -r -a "*.ts,.bin,.deps,.github,.vscode,bin.js,makefile" --ignore="license,makefile*"
  cd -

  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
