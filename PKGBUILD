# Maintainer: Jamie Magee <jamie DOT magee AT gmail DOT com>
_npmname=@zeit/cosmosdb-server
pkgname=cosmosdb-server
pkgver=0.13.1
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
b2sums=('d9b347b839c7f248f882af04977c463cb1480a9ed5fc1c6d7b0eac110f175efa75a3d4f0a8cb82b6d0bcf70ecadafe45debed598f831ae28b3e191107a864c14')

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
