# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=mssql
pkgname=nodejs-$_npmname
pkgver=8.1.0
pkgrel=1
pkgdesc="Microsoft SQL Server client for Node.js"
arch=('any')
url="https://github.com/tediousjs/node-mssql"
license=('MIT')
depends=('nodejs')
optdepends=()
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('d660eafdf0fcf529e2c839705b9455d60ccbacf5')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
