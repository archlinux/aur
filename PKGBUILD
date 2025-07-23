# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@vercel/cosmosdb-server
pkgname=cosmosdb-server
pkgver=1.0.0 # renovate: datasource=npm depName=@vercel/cosmosdb-server
pkgrel=2
pkgdesc="A Cosmos DB server implementation for testing your applications locally."
arch=(any)
url="https://github.com/vercel/cosmosdb-server"
license=(MIT)
makedepends=('npm')
depends=('nodejs')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
b2sums=('b5c83fbd3a2ce67732bb3da29d63551ac13d2ca439e43102d6ba1adef8462d94c5760edf1d35d7bf1593c6c33a92076eb3b97d51c2907e753dd15201628c53d6')

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
