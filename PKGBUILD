# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=volar
pkgname=vue-language-server
pkgver=1.0.11
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/johnsoncodehk/volar/tree/master/vue-language-tools/vue-language-server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'pnpm' 'typescript')
optdepends=('typescript: for use in typescript.tsdk')
source=("https://github.com/johnsoncodehk/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('69328fc501f3e47876114aff485be349234ee440a998bcd1832f53e14114bd9c0d52cda7bff817ff563538025040025d945a7cc79d33625bc6fb521d5a622d60')

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
  cd $_name-$pkgver/vue-language-tools/$pkgname
  local _npmdir=/usr/lib/node_modules/@$_name/$pkgname
  install -d "$pkgdir"{/usr/bin,"$_npmdir"}
  ln -s "$_npmdir"/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname

  # Prune devDependencies
  rm -r node_modules
  npm install --production

  cp -r bin node_modules out package.json "$pkgdir/$_npmdir"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
