# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=language-tools
pkgname=vue-language-server
pkgver=1.1.0
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/vuejs/language-tools/tree/master/packages/vue-language-server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'pnpm' 'typescript')
optdepends=('typescript: for use in typescript.tsdk')
source=("https://github.com/vuejs/language-tools/archive/v$pkgver/vuejs_$_name-$pkgver.tar.gz")
b2sums=('bc3280fee559fd4d3cab374f0f13648f74ab7ffc4ec9d5d80b10d14fa60271eaec0e5a06d7457bb98b677f9429982831c607d180e38beda0fbe519351c863fbc')

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
  local _npmdir=/usr/lib/node_modules/@volar/$pkgname
  install -d "$pkgdir"{/usr/bin,"$_npmdir"}
  ln -s "$_npmdir"/bin/$pkgname.js "$pkgdir"/usr/bin/$pkgname

  # Prune devDependencies
  rm -r node_modules
  npm install --production

  cp -r bin node_modules out package.json "$pkgdir/$_npmdir"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
