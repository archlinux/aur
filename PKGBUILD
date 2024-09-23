# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@vercel/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.15.1 # renovate: datasource=npm depName=@vercel/cosmosdb-server
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
b2sums=('815eaa727bafe1ff7d61c2d70e4fe9dee6a961cec86422df349b9f8236b293c03cd225b46668512385aa0adb348ac17b860b669c300cb49903067810fc2ad909')

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
