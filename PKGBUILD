# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=less-plugin-clean-css
pkgname=nodejs-$_npmname
pkgver=1.5.1
pkgrel=3
pkgdesc='Post-process and compress CSS using clean-css'
arch=(any)
url="https://github.com/less/$_npmname"
license=(MIT)
depends=(nodejs
         nodejs-less
         nodejs-clean-css)
makedepends=(jq moreutils npm)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('c5cd0dbe94303e4660f89540ae6f5d28f197272f11b57744a1b5dccb4f398830')
noextract=("$_npmname-$pkgver.tgz")

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir/usr/lib/node_modules/root" -delete
    find "$pkgdir/usr" -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
