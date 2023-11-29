# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-lsp
pkgver=2.0.0
pkgrel=1
pkgdesc='Stylelint Language Server'
arch=('any')
url=https://github.com/bmatcuk/stylelint-lsp
license=('MIT')
depends=('nodejs' 'stylelint' 'typescript')
makedepends=('git' 'npm' 'pnpm')
source=("git+$url.git#tag=v$pkgver?signed")
b2sums=('SKIP')
validpgpkeys=('BAAFE045FFA3EF32E994C33F744A40ED60D7626F') # Bob Matcuk <bmatcuk@gmail.com>

prepare() {
  cd $pkgname
  pnpm install --frozen-lockfile
}

build() {
  cd $pkgname
  pnpm build
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname
  install -d "$pkgdir"/{usr/bin,$mod_dir}
  ln -s $mod_dir/dist/index.js "$pkgdir"/usr/bin/stylelint-lsp

  cd $pkgname
  # Prune unnecessary packages
  rm -r node_modules
  npm install --production --ignore-scripts
  rm -r node_modules/{stylelint,typescript}

  cp -r dist node_modules package.json "$pkgdir"/$mod_dir
  chmod +x "$pkgdir"/$mod_dir/dist/index.js
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
