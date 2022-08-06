# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=volar
pkgname=vue-language-server
pkgver=0.39.5
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/johnsoncodehk/volar/tree/master/packages/server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'pnpm' 'typescript')
optdepends=('typescript: for use in typescript.serverPath')
source=("https://github.com/johnsoncodehk/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('414d26c1a3877a67b4241c285b180cd28b8ded47595551d8c363e45328c19b9bdfaa48eaf38f865d3432d305ee5cbf52e918991299747c21292380e30d62d96e')

prepare() {
  cd $_name-$pkgver
  pnpm install
}

build() {
  cd $_name-$pkgver
  npm run build
}

check() {
  cd $_name-$pkgver
  npm run test
}

package() {
  cd $_name-$pkgver/packages/$pkgname
  local _npmdir=/usr/lib/node_modules/@$_name/$pkgname
  install -d "$pkgdir"{/usr/bin,"$_npmdir"}
  ln -s "$_npmdir"/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname

  # Prune devDependencies
  rm -r node_modules
  npm install --production

  cp -r bin node_modules out package.json "$pkgdir/$_npmdir"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
