# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=16.3.1
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
b2sums=('409287e308d3e484d4a92a90cb15a65eb567f23c1cb16df8a377df469b9c04b2c5f04b567e1be5caebf47c1afaa88c6e818232b48d18834444db968a500ca1fa')

prepare() {
  cd $pkgname
  npm ci
}

check() {
  cd $pkgname
  npm test --ignore-scripts
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname
  install -d "$pkgdir"/{usr/bin,usr/share/doc/$pkgname,$mod_dir}
  ln -s $mod_dir/bin/$pkgname.mjs "$pkgdir"/usr/bin/$pkgname

  cd $pkgname
  npm prune --production

  rsync -r --exclude=__tests__ --exclude=lib/testUtils lib "$pkgdir"/$mod_dir
  cp -r bin node_modules package.json "$pkgdir"/$mod_dir
  cp -r {CHANGELOG,CONTRIBUTING,README}.md docs "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
