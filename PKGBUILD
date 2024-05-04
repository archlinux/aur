# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=16.5.0
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
b2sums=('2efae6049c07795a95f9c08089b73f5d269e682c2d48cdd2258b268926d8c89a2edfb4a28c55e80c730e765883b2e35d48951902966752a027173802bc4434d4')

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
