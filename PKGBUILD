# Maintainer: Justin Kromlinger <mail at hashworks dot net>
# Contributor: Valentijn "noirscape" V. <neko at catgirlsin dot space>
pkgname=mwoffliner
pkgver=1.11.1
pkgrel=1
pkgdesc="Mediawiki/Parsoid HTML snapshot utility and ZIM file builder"
arch=(any)
url="https://github.com/openzim/mwoffliner#readme"
license=(GPL3)
depends=('zim-tools' 'nodejs' 'npm' 'jpegoptim' 'advancecomp' 'gifsicle' 'pngquant' 'imagemagick' 'redis')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('f8a560408790add88844bbcf0832801467a45920f257c6ba5e4d0332f238791c')
makedepends=('jq')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" $pkgname@$pkgver

  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}



# vim:set ts=2 sw=2 et:
