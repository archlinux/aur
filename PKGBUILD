# Maintainer: Vitor Barbosa <vitorqb@gmail.com>
_npmname=shadow-cljs
pkgname=nodejs-shadow-cljs
pkgver=2.11.23
pkgrel=1
pkgdesc="ClojureScript compilation made easy http://shadow-cljs.org/"
arch=(any)
url="http://shadow-cljs.org/"
license=(EPL)
depends=('nodejs')
optdepends=()
makedepends=('npm' 'jq')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('fc4d635597aad4f3c1a54ea4421c7b73c5e044f8a657b5e4752fdee7fb96edf9')

package() {
  # Credits to https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=nodejs-nativefier
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -0 sed -i '/_where/d'
  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$_npmname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"
}
