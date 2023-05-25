# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@vercel/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.15.0 # renovate: datasource=npm depName=@vercel/cosmosdb-server
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
b2sums=('e12dc5b26ea6b9bb5f6c396819b2e18712d5d2f2c69feb5e034663bcdbcfa16960a38c004d4681e7877bfe606d19180b24440ebf3b14c260887895b03c992e29')

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
