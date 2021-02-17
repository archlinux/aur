# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server
pkgver=0.5.1
pkgrel=4
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('jq' 'yarn')
checkdepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('0504769db1f386bc588302550652f5b5e1f393a9c7cdadd6a52f1ae60bbee8c0b24a3bebeef17d2e97bb4c23a21e9de47853cbf07e65f8704b6544c0e3de0663')

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
