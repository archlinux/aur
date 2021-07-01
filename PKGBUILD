# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server
pkgver=0.5.4
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('jq' 'yarn')
checkdepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ba5fe257c2f4f6c2b0aa01ee50578798e6b484acec9e86a586022c89fcf3a50496872ad1d9422d6166f322e356e0be28dd45009cbf5f72001d6330c7c49dc19f')

# Fails to run with commander>=5
prepare() {
  cd $pkgname-$pkgver/server
  yarn add --ignore-scripts commander@4
}

build() {
  cd $pkgname-$pkgver
  yarn --ignore-scripts --frozen-lockfile
  yarn compile # Needs bin links
}

check() {
  cd $pkgname-$pkgver
  yarn test
}

package() {
  cd $pkgname-$pkgver

  # Emulate `npm prune --production` for server workspace deps
  mv package.json{,.bak}
  cp server/package.json .
  yarn remove --frozen-lockfile $(jq -r '.devDependencies | keys | join(" ")' \
    package.json)
  mv package.json{.bak,}

  install -d "$pkgdir"/usr/{bin,lib/node_modules/$pkgname}
  ln -s ../lib/node_modules/$pkgname/lib/cli.js "$pkgdir"/usr/bin/$pkgname
  chmod +x server/lib/cli.js
  cp -r server/lib node_modules package.json \
    "$pkgdir"/usr/lib/node_modules/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
}

# vim:set ts=2 sw=2 et:
