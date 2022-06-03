# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@zeit/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.13.4 # renovate: datasource=github-tags depName=vercel/cosmosdb-server
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
b2sums=('34744d347fb0caee6a0cb6e263113369d82f8754527324fc32d14163beafe1f1138f6befb10f85f06d157bf7a3f32027b6fde32f3847cda30c34983a76c7ea4b')

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
