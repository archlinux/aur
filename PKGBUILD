# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=html-eslint
pkgver=0.13.2
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
b2sums=('7ee41dc44b82bf6e92f5bccb9acb50f90ea5c10f4be9bc6cbaead920ebdf6817bce2933b970d922ededdc511ffcd66fcb5730c286fa5d24ef550a44e5062d86d')

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
