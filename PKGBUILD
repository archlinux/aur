# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=16.10.0
pkgrel=1
pkgdesc='Mighty, modern CSS linter'
arch=(any)
url=https://stylelint.io
license=(MIT)
depends=(nodejs)
makedepends=(
  git
  npm
  rsync
)
optdepends=('stylelint-config-standard: for the standard shareable config')
options=(!emptydirs)
source=("git+https://github.com/stylelint/stylelint.git#tag=$pkgver")
b2sums=('36665a7948a1ea5ac37121c164ee643e268f62daef3ae0bc76e603cede9ac1d2a6c2cf3bf24d0c5dded32fcf38ad208e84b5c053c7e12fcbcb7881d640f14890')

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
