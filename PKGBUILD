# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=html-eslint
pkgver=0.13.1
pkgrel=1
pkgdesc='ESLint plugin for HTML'
arch=('any')
url=https://yeonjuan.github.io/html-eslint/
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'typescript')
optdepends=('eslint: for use via eslint')
install=$pkgname.install
source=("https://github.com/yeonjuan/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('9122edb60dec4e48aaa373a0cb9eaafb2f9f59bb8a9210952ae275f44e4b21bb977d47a81f8f0d9d410dbbccc39d1568cc1c4e1d5139ba1472c6e5a11bc226bf')

prepare() {
  cd $pkgname-$pkgver
  npm ci
}

build() {
  cd $pkgname-$pkgver
  npm run bootstrap
}

check() {
  cd $pkgname-$pkgver
  npm run check:ts
  npm run test
}

package() {
  local _npmdir=/usr/lib/node_modules/@$pkgname
  install -d "$pkgdir"{/usr/bin,$_npmdir/{cli,eslint-plugin,parser}}
  ln -s $_npmdir/cli/lib/cli.js "$pkgdir"/usr/bin/$pkgname

  cd $pkgname-$pkgver
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE

  pushd packages/cli
  cp -r lib node_modules package.json "$pkgdir"/$_npmdir/cli
  chmod +x "$pkgdir"/$_npmdir/cli/lib/cli.js
  popd

  pushd packages/eslint-plugin
  cp -r lib package.json "$pkgdir"/$_npmdir/eslint-plugin
  popd

  pushd packages/parser
  cp -r lib package.json "$pkgdir"/$_npmdir/parser
  popd
}

# vim:set ts=2 sw=2 et:
