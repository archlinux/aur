# Maintainer: bacteriostat <dev.bacteriostat at aleeas dot com>
# Contributor: Hugues Chabot <at google mail>

pkgname=nodejs-serverless
_pkgname=${pkgname#nodejs-}
pkgver=3.26.0
pkgrel=1
pkgdesc="Serverless Framework - Build web, mobile and IoT applications with serverless architectures using AWS Lambda, Azure Functions, Google CloudFunctions & more"
arch=(any)
url="https://serverless.com/framework/docs/"
license=(MIT)
depends=('nodejs')
makedepends=('npm' 'jq')
optdepends=()
conflicts=('nodejs-serverless-git')
source=(https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha256sums=('8cf3d955d656c5fe37a14d540a04a18036af5903d553d0fc6db9d74d597b4615')

prepare() {
  tar -xf "$srcdir/$_pkgname-$pkgver.tgz" --directory "$srcdir" "package/LICENSE.txt"
}

package() {
  # Install package using npm.
  npm install \
  	--global \
  	--prefix "$pkgdir/usr" \
  	--cache "$srcdir/npm-cache" \
  	--ignore-scripts \
  	"$srcdir"/$_pkgname-$pkgver.tgz

  # Install license
  install -Dm644 "$srcdir/package/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Remove local paths from package.json
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
