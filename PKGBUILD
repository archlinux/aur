# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=15.10.2
pkgrel=1
pkgdesc='Mighty, modern CSS linter'
arch=('any')
url=https://stylelint.io
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'rsync')
optdepends=('stylelint-config-standard: for the standard shareable config')
options=('!emptydirs')
source=("git+https://github.com/stylelint/stylelint.git#tag=$pkgver")
b2sums=('SKIP')

prepare() {
  cd $pkgname
  npm ci
}

check() {
  cd $pkgname
  npm test --ignore-scripts
}

package() {
  local _npmdir=/usr/lib/node_modules/$pkgname
  install -d "$pkgdir"/{usr/bin,usr/share/doc/$pkgname,$_npmdir}
  ln -s $_npmdir/bin/$pkgname.mjs "$pkgdir"/usr/bin/$pkgname

  cd $pkgname
  npm prune --production

  rsync -r --exclude __tests__ --exclude lib/testUtils lib "$pkgdir"/$_npmdir
  cp -r bin node_modules package.json "$pkgdir"/$_npmdir
  cp -r {CHANGELOG,CONTRIBUTING,README}.md docs "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
