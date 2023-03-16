# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@vercel/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.14.0 # renovate: datasource=npm depName=@vercel/cosmosdb-server
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
b2sums=('2aba862614f48bb4c65c2e6acb97c602a0b16cc8deb2a6ed27905ee9f7625f6f9e0e92fe5aabf87fe651591e8c0a2033dcad9171efeff355deec5364a14f28dc')

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
