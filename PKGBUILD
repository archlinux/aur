# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server
pkgver=0.5.1
pkgrel=3
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('yarn')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
b2sums=('0504769db1f386bc588302550652f5b5e1f393a9c7cdadd6a52f1ae60bbee8c0b24a3bebeef17d2e97bb4c23a21e9de47853cbf07e65f8704b6544c0e3de0663')

build() {
  cd $pkgname-$pkgver
  yarn --ignore-scripts --non-interactive
  yarn compile # Needs bin links

  # Shallowly install server workspace dependencies
  mv package.json{,.bak}
  cd server
  yarn --ignore-scripts --production --non-interactive --no-bin-links
  mv ../package.json{.bak,}
}

check() {
  cd $pkgname-$pkgver
  yarn test
}

package() {
  cd $pkgname-$pkgver/server
  install -d "$pkgdir"/usr/{bin,lib/node_modules/$pkgname}
  cp -r lib node_modules package.json "$pkgdir"/usr/lib/node_modules/$pkgname
  chmod 755 "$pkgdir"/usr/lib/node_modules/$pkgname/lib/cli.js
  ln -s /usr/lib/node_modules/$pkgname/lib/cli.js \
    "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
