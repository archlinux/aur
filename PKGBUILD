# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: hexchain <i at hexchain dot org>

pkgname=yaml-language-server
pkgver=0.20.0
pkgrel=1
pkgdesc='YAML Language Server'
url=https://github.com/redhat-developer/yaml-language-server
license=('MIT')
arch=('any')
depends=('nodejs')
makedepends=('jq' 'yarn')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('a22553539f3b38dae93afbbf79ee365b71526917bd393ce48bdb7bc5bda4c094836eefe17706608d7687922c72721d815aa45a506feb8ca8997a0cbd423b9042')

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
