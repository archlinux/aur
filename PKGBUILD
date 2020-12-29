# Maintainer: Julian Hauser <julian at julianhauser.com>

pkgname=textlint-filter-rule-allowlist
pkgver=2.0.1
pkgrel=1
pkgdesc="Textlint Filter Allowlist"
arch=(any)
url="https://github.com/textlint/textlint-filter-rule-allowlist"
license=("MIT")
depends=("nodejs" "textlint")
makedepends=("npm")
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=("b3bb7cc41fc9789f34da28e72baf169ef92009238ec06ad11a645040925dbe2d")

package() {

    cd $srcdir

    # remove cache folder
    if [[ -d npm-cache ]]; then rm -rf npm-cache; fi

    # npm install with the local tarball
    npm install \
        --cache "${srcdir}/npm-cache" \
        --production \
        --no-optional \
        --no-audit \
        -g \
        --user root \
        --prefix "$pkgdir/usr" \
        $pkgname-$pkgver.tgz

    # change the destination of references
    grep -Rl "$pkgdir" "$pkgdir" | xargs -r sed -i "s@${pkgdir}@@g"
    grep -Rl "$srcdir" "$pkgdir" | xargs -r sed -i "s@\"${srcdir}.*\"@\"\"@g"

    # change owner
    chown -R root:root "${pkgdir}"

    # install README
    install -Dm644 "${srcdir}/package/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
