# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server
pkgver=0.9.7
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('jq' 'yarn')
checkdepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('e38ba2e85dd06c89ebe0e1debd5354e40b8016b0907d6207f7f8fa4e20ccb29d637fa6e5978bee439cd15f1eb7c107712da1b9a66baa748215cb7c4d2c7f1c52')

prepare() {
  cd $pkgname-$pkgver
  yarn --frozen-lockfile
}

build() {
  cd $pkgname-$pkgver
  yarn compile # Needs bin links
}

check() {
  cd $pkgname-$pkgver
  yarn test
}

package() {
  cd $pkgname-$pkgver

  # Emulate `npm prune --production`
  cp package.json{,.bak}
  read -ra devDependencies < <(jq -r '.devDependencies | keys | join(" ")' package.json)
  yarn remove --frozen-lockfile "${devDependencies[@]}"
  mv package.json{.bak,}

  install -d "$pkgdir"/usr/{bin,lib/node_modules/$pkgname}
  ln -s ../lib/node_modules/$pkgname/lib/cli.js "$pkgdir"/usr/bin/$pkgname
  chmod +x lib/cli.js
  cp -r lib node_modules package.json "$pkgdir"/usr/lib/node_modules/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
}

# vim:set ts=2 sw=2 et:
