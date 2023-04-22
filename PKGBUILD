# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=language-tools
pkgname=vue-language-server
pkgver=1.4.4
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/vuejs/language-tools/tree/master/packages/vue-language-server
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'pnpm' 'typescript')
optdepends=('typescript: for use in typescript.tsdk')
source=("vuejs_$_name::git+https://github.com/vuejs/language-tools.git#tag=v$pkgver")
b2sums=('SKIP')

prepare() {
  cd vuejs_$_name
  pnpm install
}

build() {
  cd vuejs_$_name
  npm run build
}

check() {
  cd vuejs_$_name
  npm run test
}

package() {
  cd vuejs_$_name/packages/$pkgname
  local _npmdir=/usr/lib/node_modules/@volar/$pkgname
  install -d "$pkgdir"{/usr/bin,"$_npmdir"}
  ln -s "$_npmdir"/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname

  # Prune devDependencies
  rm -r node_modules
  npm install --production

  cp -r bin node_modules out package.json "$pkgdir/$_npmdir"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
