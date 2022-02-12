# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=volar
pkgname=volar-server
pkgver=0.31.3
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/johnsoncodehk/volar/tree/master/packages/server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'typescript' 'yarn')
optdepends=('typescript: for use in typescript.serverPath')
source=("https://github.com/johnsoncodehk/volar/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('9ed8857e229c776b08fb2eef75d7b1fc3845bf35818624af7e508b67111ecc134401ec066b95e8effe80bda8c07f91af3e521d1fa3a0e095a495ed190442271e')

prepare() {
  cd $_name-$pkgver
  yarn --frozen-lockfile

  # Emulate `npm prune --production` for server workspace
  mv package.json{,.bak}
  pushd packages/server
  yarn --prefer-offline --ignore-scripts --no-bin-links --production \
    --frozen-lockfile
  popd
  mv package.json{.bak,}
}

build() {
  cd $_name-$pkgver
  yarn build
}

package() {
  cd $_name-$pkgver
  local _npmdir=/usr/lib/node_modules/@volar/server
  install -d "$pkgdir"{/usr/bin,"$_npmdir"}
  ln -s "$_npmdir"/bin/volar-server.js "$pkgdir"/usr/bin/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
  cd packages/server
  cp -r bin node.js node_modules out package.json "$pkgdir/$_npmdir"
}

# vim:set ts=2 sw=2 et:
