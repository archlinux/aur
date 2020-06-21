# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@zeit/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.7.0
pkgrel=2
pkgdesc="A Cosmos DB server implementation for testing your applications locally."
arch=(any)
url="https://github.com/vercel/cosmosdb-server"
license=(MIT)
makedepends=('npm')
depends=('nodejs')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/@zeit%2fcosmosdb-server-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('7d85d848560492ddb31602ad30b1850dc643cd034062951b35764e1cbff64b37f78df5127854fdfb8032c12f267b6eae01c0981f2ee7ac6046186e5c6131e19d')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
