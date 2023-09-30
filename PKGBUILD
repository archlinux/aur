# Maintainer: matoro <matoro at airmail.cc>
# Contributor: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=nodejs-resume-cli
pkgver=3.0.8
pkgrel=1
pkgdesc="The command line tool for JSON Resume"
arch=(any)
url="https://github.com/jsonresume/resume-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname:7}/-/${pkgname:7}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('e036f284b413c7f7f64bcdd437b289b114afe1c0517c78c618898063e2c134aa034de3e0d53abebf9651a31a50ad71e812941d77ffc1ca476e22cff26f58ccbd')

package() {
   npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"


   # Non-deterministic race in npm gives 777 permissions to random directories.
   # See https://github.com/npm/cli/issues/1103 for details.
   find "$pkgdir/usr" -type d -exec chmod 755 {} +

   # Remove references to $pkgdir
   find "$pkgdir" -type f -name package.json -exec sed -i "/_where/d" {} +

   # Remove references to $srcdir
   local tmppackage="$(mktemp)"
   local pkgjson="$pkgdir/usr/lib/node_modules/${pkgname:7}/package.json"
   jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
   mv "$tmppackage" "$pkgjson"
   chmod 644 "$pkgjson"

   find "$pkgdir" -type f -name package.json | while read pkgjson; do
       local tmppackage="$(mktemp)"
       jq 'del(.man)' "$pkgjson" > "$tmppackage"
       mv "$tmppackage" "$pkgjson"
       chmod 644 "$pkgjson"
   done
}
