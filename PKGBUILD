# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=sword-interface
pkgname="nodejs-$_npmname"
pkgver=0.116.0
pkgrel=1
pkgdesc='Javascript (N-API) interface to SWORD library'
arch=('x86_64')
url="https://github.com/tobias-klein/${pkgname/js-/-}"
license=('GPL3')
depends=('node-gyp' 'nodejs' 'nodejs-addon-api' 'sword')
makedepends=('jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('733d8db2deaafb947b95a25e3388677545463b35bf798dc6ee6e94a589710cf4')

prepare() {
    cd "${pkgname/js}-$pkgver"
    npm uninstall node-gyp
}

build() {
    cd "${pkgname/js}-$pkgver"
    npm pack
}

package() {
    cd "${pkgname/js}-$pkgver"
    export LINK_SYSTEM_SWORD=1
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" ${pkgname/js}-$pkgver.tgz
    rm -rf "$pkgdir/usr/lib/node_modules/${pkgname/js}/"{node_modules,sword_build,*.tgz,build/{sword_build,node_modules}}
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
