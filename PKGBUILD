# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: hexchain <i at hexchain dot org>

pkgname=yaml-language-server
pkgver=0.19.0
pkgrel=1
pkgdesc='YAML Language Server'
url=https://github.com/redhat-developer/yaml-language-server
license=('MIT')
arch=('any')
depends=('nodejs')
makedepends=('jq' 'yarn')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('5448947dd998fd4e5212810f48ff719439b49b747ae1aa5f5fce891fcdbfe8c7664f66c8b44bb8068e4e09d708f415f7f3d6121cdcbda3b8c275d596c504fae6')

build() {
  cd $pkgname-$pkgver
  yarn --frozen-lockfile
  yarn compile
  yarn build:libs
}

check() {
  cd $pkgname-$pkgver
  yarn test
}

package() {
  cd $pkgname-$pkgver

  # Emulate `npm prune --production`
  cp package.json{,.bak}
  yarn remove --frozen-lockfile $(jq -r '.devDependencies | keys | join(" ")' \
    package.json)
  mv package.json{.bak,}

  install -d "$pkgdir"/usr/{bin,lib/node_modules/$pkgname}
  ln -s ../lib/node_modules/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
  cp -r bin lib node_modules out package.json \
    "$pkgdir"/usr/lib/node_modules/$pkgname
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
