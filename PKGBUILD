# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=codestats-cli
pkgver=1.0.2
pkgrel=1
pkgdesc="A command utility to view your stats from Code::Stats"
arch=('any')
url="https://gitlab.com/code-stats/codestats-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq')
source=(
    "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('37f3bd3db2ac0f7f17c1252a598c3d6894c8fe967119befb8e12958c6f35f6d1')

package() {
    npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    chown -R root:root "${pkgdir}"

    # Remove references to $pkgdir
    find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"

    # Remove references to $srcdir
    local tmppackage="$(mktemp)"
    local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" >"$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
}
