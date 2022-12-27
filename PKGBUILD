# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=volar
pkgname=vue-language-server
pkgver=1.0.18
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/johnsoncodehk/volar/tree/master/vue-language-tools/vue-language-server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'pnpm' 'typescript')
optdepends=('typescript: for use in typescript.tsdk')
source=("https://github.com/johnsoncodehk/$_name/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('8a678c53817935bb078bb07b3df65e375287f229a23575aecb95613f37736af2efbc2cef5296959b490ae382a9b121d022217338aedb3169c446fd240c88477e')

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
