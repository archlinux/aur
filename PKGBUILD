# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=16.3.0
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
b2sums=('97fb7bab49e7d8a5f8e6940a525c277dd666220ecc9f6cb7e22888ee3941b61f5a1d4eed298e3e9c18c6c1cb490bfedb745b15c805e938ff17e21c64e8977d1f')

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
