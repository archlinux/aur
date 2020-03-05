# Maintainer: Caleb Maclennan <caleb@alerque.com>

_npmname=sword-interface
pkgname="nodejs-$_npmname"
pkgver=0.114.0
pkgrel=1
pkgdesc='Javascript (N-API) interface to SWORD library'
arch=('x86_64')
url="https://github.com/tobias-klein/${pkgname/js-/-}"
license=('GPL3')
depends=('nodejs' 'sword' 'nodejs-addon-api')
makedepends=('jq' 'moreutils' 'node-gyp' 'npm')
# source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
# sha256sums=('859bd1f5a4db0c0df3adf1089dea9c8241138986bbcd2d70dee9002fdafd2d35')
_sha=971d8169d82d010280ec18da6f74b4eff0391191
source=("$url/archive/$_sha.zip")
sha256sums=('SKIP')

build() {
    # cd "${pkgname/js}-$pkgver"
    cd "${pkgname/js}-$_sha"
    export LINK_SYSTEM_SWORD=1
    npm run build
    npm pack
}

package() {
    # cd "${pkgname/js}-$pkgver"
    cd "${pkgname/js}-$_sha"
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" ${pkgname/js}-$pkgver.tgz
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
