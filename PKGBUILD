# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=16.8.2
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
b2sums=('01da54aa22c9611046832682a7bf5b3e5933b47fc3614ea793fd87e1192dbbaf764d54965736a0315e1bbb012e5eeecca5dcaaa6efc802ab06793993cd336594')

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
