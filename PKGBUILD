# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: hexchain <i at hexchain dot org>

pkgname=yaml-language-server
pkgver=0.22.0
pkgrel=1
pkgdesc='YAML Language Server'
url=https://github.com/redhat-developer/yaml-language-server
license=('MIT')
arch=('any')
depends=('nodejs')
makedepends=('jq' 'yarn')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('10cd832032dc3644d31f7e5b927360904ea337b371b086187b98772fa351ca8bd0de22a53d49419d2a5a60bb0c34cb221aa0a9bb1908b9700e234e9d9cb0967f')

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
