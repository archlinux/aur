# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
# Maintainer: David C Rankin <drankinatty at gmail dot com>
# Contributor: Martin Reboredo <yakoyoku at gmail dot com>

pkgname=mongosh
pkgver=2.12.0
pkgrel=1
pkgdesc='Rich Node.js REPL for interacting with MongoDB instances.'
arch=('x86_64')
url='https://github.com/mongodb-js/mongosh'
license=('Apache')

depends=(nodejs krb5)
makedepends=(npm)
optdepends=('libmongocrypt: session encryption support')

source=(
  https://github.com/mongodb-js/mongosh/archive/refs/tags/v"$pkgver".tar.gz
)

sha256sums=('48247969913fe1f92662c54d31c0002f122fb731e46afd50e95e279cfbe5d55a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  npm run bootstrap
  npm run compile-cli
  npm run webpack-build -w packages/cli-repl
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/bin" 

  # Install node executable
  echo "#!/usr/bin/env node" | cat - packages/cli-repl/dist/mongosh.js > "$pkgdir"/usr/bin/mongosh

  chmod 755 "$pkgdir/usr/bin/mongosh"

  # Install licences and docs
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 "THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  cp -r "docs" "$pkgdir/usr/share/doc/$pkgname/"
  chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/docs"
}
