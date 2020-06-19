# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@zeit/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.7.0
pkgrel=1
pkgdesc="A Cosmos DB server implementation for testing your applications locally."
arch=(any)
url="https://github.com/vercel/cosmosdb-server"
license=(MIT)
makedepends=('npm')
depends=('nodejs')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/@zeit%2fcosmosdb-server-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('8aa9450afbc9d907a3617d37a9c7a9693fd4449533bc78250f72e519d512866a')

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
