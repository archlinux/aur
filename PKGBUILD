# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server
pkgver=0.9.3
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('jq' 'yarn')
checkdepends=('npm')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('db07becffe54bde14ae1fa6358b61eca54c25ba388ee99d1abd6eeb7ade3e7390d113e386438557bad032f29b09507d0bf6c22431057632945570d6897e20774')

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
