# Maintainer: Justin Kromlinger <mail at hashworks dot net>
# Contributor: Valentijn "noirscape" V. <neko at catgirlsin dot space>
pkgname=mwoffliner
pkgver=1.10.10
pkgrel=2
pkgdesc="Mediawiki/Parsoid HTML snapshot utility and ZIM file builder"
arch=(any)
url="https://github.com/openzim/mwoffliner#readme"
license=(GPL3)
depends=('zimwriterfs>=1.3.7' 'nodejs' 'npm' 'jpegoptim' 'advancecomp' 'gifsicle' 'pngquant' 'imagemagick' 'redis')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('6ccf04716fb675b642ddc4a8caecab68d43185e3a7e803ac98c195b7b8a4a690')
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
