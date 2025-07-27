# Maintainer: Phantasm <phantasm@centrum.cz>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-lsp
pkgver=2.0.1
pkgrel=2
pkgdesc='Stylelint Language Server'
arch=(any)
url=https://github.com/bmatcuk/stylelint-lsp
license=(MIT)
depends=(
  nodejs
  stylelint
  typescript
)
makedepends=(
  git
  npm
  pnpm
)
source=("git+$url.git#tag=v$pkgver?signed"
	pnpm-lockfile-version-mismatch.patch)
b2sums=('1ab1c858e96a5148fce31b617b01532b5fe140bc0220f4920095369b7fb02877c36153a1b4e48893dd56e8929b2fab2aae4d4237faf768deb45b0dba11f18e4f'
	'6d06061723ff60ae8be01c067fab1cb633fa9e7fe92df6de9b36b75feb8ceafafbd3d1fe8c7aad4daf4c58e0e978430ac4e4eaa8b911556750634284d56fa2d2')
validpgpkeys=(BAAFE045FFA3EF32E994C33F744A40ED60D7626F) # Bob Matcuk <bmatcuk@gmail.com>

prepare() {
  patch -d $pkgname -p1 < pnpm-lockfile-version-mismatch.patch
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
  npm install --omit=dev --ignore-scripts
  rm -r node_modules/{stylelint,typescript}
  rm -r node_modules/.bin

  cp -r dist node_modules package.json "$pkgdir"/$mod_dir
  chmod +x "$pkgdir"/$mod_dir/dist/index.js
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
