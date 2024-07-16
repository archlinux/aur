# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=less-plugin-clean-css
pkgname=nodejs-$_npmname
pkgver=1.6.0
pkgrel=1
pkgdesc='Post-process and compress CSS using clean-css'
arch=(any)
url="https://github.com/less/$_npmname"
license=(MIT)
depends=(nodejs
         nodejs-less
         nodejs-clean-css)
makedepends=(jq moreutils npm)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('577de8336c284d6cb454cd6dd71910a2fc85d9a05b5c9e15efc598de89848dda')
noextract=("$_npmname-$pkgver.tgz")

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir/usr/lib/node_modules/root" -delete
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
