# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=@vmprint/cli
pkgname=vmprint
pkgver=1.0.5
pkgrel=1
pkgdesc='Pure TypeScript spacial layout engine'
arch=(any)
url="https://github.com/cosmiciron/$pkgname"
license=(Apache-2.0)
depends=(nodejs)
makedepends=(jq
             npm
             moreutils)
source=("https://registry.npmjs.org/$_npmname/-/${_npmname#*/}-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha256sums=('ca2d7c2d4b4f2807e4d0ecc35fafa94b1de7f510b48018f5fed30141232404ca')

package() {
    npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
