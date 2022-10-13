# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=volar
pkgname=vue-language-server
pkgver=1.0.7
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/johnsoncodehk/volar/tree/master/vue-language-tools/vue-language-server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'pnpm' 'typescript')
optdepends=('typescript: for use in typescript.tsdk')
source=("https://github.com/johnsoncodehk/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('40863fc6faa3a5530ebfa867c80287bd36950b189cbb0a0248577ee0b0fe65a9116a6fb7654d351d10e8cdd36bf6f52fbec1ff9c2d76ea6b7db2c75afcc16b57')

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
