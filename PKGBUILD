# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=nodejs-hexo-cli
_pkgname=${pkgname#nodejs-}
pkgver=4.2.0
pkgrel=2
pkgdesc="Command line interface for Hexo"
arch=('any')
url="https://github.com/hexojs/hexo-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo')
source=(https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha256sums=('f169b782712f88eb4ebfc7498a359a0535852c2166e7f58193b85caee8f992e9')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown --recursive root:root "${pkgdir}"

  install --directory "$pkgdir"/usr/share/licenses/$pkgname
  ln --symbolic ../../../lib/node_modules/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
