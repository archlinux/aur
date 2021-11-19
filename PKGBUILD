# Maintainer: Bjoern Bidar <theodorstormgrade@gmail.com>
pkgname=csslint
pkgver=1.0.5
pkgrel=2
pkgdesc="Automated linting of Cascading Stylesheets"
arch=('any')
url="https://github.com/stubbornella/csslint"
license=('GPL')
depends=('nodejs')
makedepends=('npm' 'jq')
conflicts=('csslint-git')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
md5sums=('86ac2064a6d01761d3be20f730ab58d9')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"


  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"


  chown -R root:root ${pkgdir}/usr
}

# vim:set ts=2 sw=2 et:
