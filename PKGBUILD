# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=typescript-language-server-git
pkgver=0.4.0.r15.gfdf2831
pkgrel=1
pkgdesc='TypeScript & JavaScript Language Server'
url=https://github.com/theia-ide/typescript-language-server
arch=('any')
license=('Apache')
depends=('nodejs')
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
  yarn --frozen-lockfile --non-interactive
}

check() {
  cd ${pkgname%-git}
  yarn test
}

package() {
  install -d "$pkgdir"/usr/{bin,lib/node_modules/${pkgname%-git}}
  ln -s /usr/lib/node_modules/${pkgname%-git}/server/lib/cli.js \
    "$pkgdir"/usr/bin/${pkgname%-git}
  cd ${pkgname%-git}
  cp -r --parents node_modules package.json server/{lib,node_modules,package.json} \
    "$pkgdir"/usr/lib/node_modules/${pkgname%-git}
  chmod 755 "$pkgdir"/usr/lib/node_modules/${pkgname%-git}/server/lib/cli.js
}

# vim:set ts=2 sw=2 et:
