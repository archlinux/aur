# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server-git
pkgver=0.5.1.r0.g3a8ea0f
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for TypeScript using tsserver'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('typescript')
makedepends=('git' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  yarn --ignore-scripts --frozen-lockfile --non-interactive
  yarn compile
  cp --parents -r server/{lib,node_modules,package.json} ..
  cd ../server
  yarn --ignore-scripts --production --non-interactive --no-bin-links
}

check() {
  cd ${pkgname%-git}
  yarn test
}

package() {
  install -d "$pkgdir"/usr/{bin,lib/node_modules/${pkgname%-git}}
  ln -s /usr/lib/node_modules/${pkgname%-git}/lib/cli.js \
    "$pkgdir"/usr/bin/${pkgname%-git}
  cd server
  cp --parents -r lib node_modules package.json \
    "$pkgdir"/usr/lib/node_modules/${pkgname%-git}
  chmod 755 "$pkgdir"/usr/lib/node_modules/${pkgname%-git}/lib/cli.js
}

# vim:set ts=2 sw=2 et:
