# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server
pkgver=0.7.1
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('jq' 'yarn')
checkdepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('3e2ae13e17a3be5f5059f7cfb6529888d64d28393ddd7499e13cf47c3388cf39e1a923588df5903e041edbc2695de3742c3043105b3ec5793670fc45767499e1')

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
