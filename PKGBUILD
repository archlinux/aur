# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=mongosh
pkgver=2.1.1
pkgrel=1
pkgdesc='Rich Node.js REPL for interacting with MongoDB instances.'
arch=('x86_64')
url='https://github.com/mongodb-js/mongosh'
license=('Apache')
depends=(nodejs krb5)
makedepends=(git npm modclean libmongocrypt)
optdepends=('libmongocrypt: session encryption support')
source=(
  https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('1c84ced61b590fbcee74141191c05dfb6d4a9d7d8328fea5ad90db7bf0dcc6de')

package() {
  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
  npm install --omit=dev -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  install -dm755 "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$pkgdir"/usr/lib/node_modules/$pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname

  cd "$pkgdir"/usr/lib/node_modules/$pkgname
  modclean --path . -r -a "*.ts,.bin,.deps,.github,.vscode,bin.js,makefile" -I "license,makefile*"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  chmod -R u=rwX,go=rX "$pkgdir"
  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
