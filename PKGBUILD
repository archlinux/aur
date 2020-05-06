# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: "Cowboy" Ben Alman (http://benalman.com/)
# Contributor: Kyle Robinson Young (http://dontkry.com/)
# Contributor: Tyler Kellen (http://goingslowly.com)
# Contributor: Sindre Sorhus (http://sindresorhus.com)
# Contributor: tkellen <tyler@sleekcode.net>
# Contributor: cracoucass14

pkgname=nodejs-grunt
_npmname=${pkgname#nodejs-}
pkgver=1.1.0
pkgrel=1
pkgdesc='The JavaScript Task Runner'
arch=(any)
url='http://gruntjs.com'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('899900960729f16e28919b5b6485a960037abcd6bb879b710321552be95d1893')
noextract=("${source[@]##*/}")

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
