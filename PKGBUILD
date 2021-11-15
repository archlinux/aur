# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=14.1.0
pkgrel=1
pkgdesc='Mighty, modern CSS linter'
arch=('any')
url=https://stylelint.io
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'rsync')
optdepends=('stylelint-config-standard: for the standard shareable config')
source=("git+https://github.com/stylelint/stylelint.git#tag=$pkgver")
b2sums=('SKIP')

prepare() {
  cd $pkgname
  npm ci
}

check() {
  cd $pkgname
  npm test
}

package() {
  cd $pkgname

  npm prune --production

  install -d "$pkgdir"/usr/{bin,share/doc/$pkgname}
  ln -s ../lib/node_modules/$pkgname/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname
  install -Dt "$pkgdir"/usr/lib/node_modules/$pkgname/bin bin/$pkgname.js
  rsync -r --exclude __tests__ --exclude lib/testUtils lib \
    "$pkgdir"/usr/lib/node_modules/$pkgname
  cp -r node_modules package.json "$pkgdir"/usr/lib/node_modules/$pkgname
  cp -r {CHANGELOG,CONTRIBUTING,README}.md docs "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
