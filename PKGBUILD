# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server-git
pkgver=0.5.4.r7.gaea14ef
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('git' 'jq' 'yarn')
checkdepends=('npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Fails to run with commander>=5
prepare() {
  cd ${pkgname%-git}/server
  yarn add --ignore-scripts commander@4
}

build() {
  cd ${pkgname%-git}
  yarn --ignore-scripts --frozen-lockfile
  yarn compile # Needs bin links
}

check() {
  cd ${pkgname%-git}
  yarn test
}

package() {
  cd ${pkgname%-git}
  # Emulate `npm prune --production` for server workspace deps
  mv package.json{,.bak}
  cp server/package.json .
  yarn remove --frozen-lockfile $(jq -r '.devDependencies | keys | join(" ")' \
    package.json)
  mv package.json{.bak,}

  install -d "$pkgdir"/usr/{bin,lib/node_modules/${pkgname%-git}}
  ln -s ../lib/node_modules/${pkgname%-git}/lib/cli.js \
    "$pkgdir"/usr/bin/${pkgname%-git}
  chmod +x server/lib/cli.js
  cp -r server/lib node_modules package.json \
    "$pkgdir"/usr/lib/node_modules/${pkgname%-git}
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
}

# vim:set ts=2 sw=2 et:
