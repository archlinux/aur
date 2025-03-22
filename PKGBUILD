# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=pandiff
pkgname=nodejs-"$_npmname"
pkgver=0.7.0
pkgrel=1
pkgdesc='Prose diffs for any document format supported by Pandoc'
arch=(any)
url="https://github.com/davidar/$_npmname"
license=(MIT)
depends=(nodejs
         pandoc)
makedepends=(jq
             moreutils
             npm)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("${source[@]##*/}")
sha256sums=('b61eb882e9018851095c93debf83716090d51211b4029be7182f34499c524383')

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
