# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Yufan You <ouuansteve at gmail>

_name=volar
pkgname=volar-server
pkgver=0.30.2
pkgrel=1
pkgdesc='Fast Vue Language Support Extension'
arch=('any')
url=https://github.com/johnsoncodehk/volar/tree/master/packages/server
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'typescript' 'yarn')
optdepends=('typescript: for use in typescript.serverPath')
source=("https://github.com/johnsoncodehk/volar/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('cb36fae82c6c995057463f3c49f0ef1b3f7023195762a90e1f6b17605f3910e14ab233341090d03da8d5a8543a87b361a303f021f27471a2fe5c9ab13309fce2')

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
