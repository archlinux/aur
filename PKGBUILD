# Maintainer: Diego Fernández Menéndez <dfimium499 at proton dot me>
# Maintainer: David C Rankin <drankinatty at gmail dot com>
# Contributor: Martin Reboredo <yakoyoku at gmail dot com>

pkgname=mongosh
pkgver=2.10.0
pkgrel=1
pkgdesc='Rich Node.js REPL for interacting with MongoDB instances.'
arch=('x86_64')
url='https://github.com/mongodb-js/mongosh'
license=('Apache')

depends=(nodejs krb5)
makedepends=(nvm python modclean)
optdepends=('libmongocrypt: session encryption support')

source=(
  https://github.com/mongodb-js/mongosh/archive/refs/tags/v"$pkgver".tar.gz
)

sha256sums=('42775a281d2848c98359c952286a0712cc170e6bb1eadc9b2a1470fa3a274b88')

options=('!debug' '!strip')

build() {
  # Use specific npm version for compilation
  source /usr/share/nvm/init-nvm.sh
  install -d nvm
  export NVM_DIR="$srcdir"/nvm
  nvm install 24.18.0

  cd "$pkgname-$pkgver"

  # Compile to js (not standalone executable)
  npm run bootstrap
  npm run compile-cli

  # Exclude build dependencies
  npm prune --production

  # Remove prebuilt binaries for platforms/libcs we're not shipping for
  find . -path '*/node_modules/@nx/nx-*' -maxdepth 6 -type d \
  ! -name 'nx-linux-x64-gnu' -prune -exec rm -rf {} +

  # Clean up unused bloat
  modclean --path . -r -a "*.ts,.bin,.deps,.github,.vscode,bin.js,makefile" -I "license,makefile*"
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir/usr/bin" 
  install -dm755 "$pkgdir/usr/share/$pkgname"

  # Install program files under /usr/share
  cp -r "$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname"
  find "$pkgdir/usr/share/$pkgname/$pkgname-$pkgver" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/$pkgname/$pkgname-$pkgver" -type f -exec chmod 644 {} +

  # Install bin wrapper
  cat > "$pkgdir/usr/bin/mongosh" << EOF
#!/bin/bash
exec node "/usr/share/$pkgname/$pkgname-$pkgver/packages/cli-repl/bin/mongosh.js" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mongosh"

  # Install licences and docs
  cd "$pkgname-$pkgver"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 "THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  cp -r "docs" "$pkgdir/usr/share/doc/$pkgname/"
  chmod -R 644 "$pkgdir/usr/share/doc/$pkgname/docs"
}
