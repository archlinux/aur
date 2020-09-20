# Maintainer: PY Chuang <pychuang@pm.me>
# Contributor: Arjun Nemani <nemaniarjun@gmail.com>
pkgname=textlint
pkgver=11.7.6
pkgrel=1
pkgdesc="The pluggable natural language linter for text and markdown."
arch=(any)
url="https://github.com/textlint/textlint/"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=("3cbd430dc6f548fc9a07efc26ccf10c8dd1f61258935a1d6696f076997d7a0a1")

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

    # to shut up namcap's warning, even though it's a MIT license
    install -Dm644 "${srcdir}/package/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

    # install README
    install -Dm644 "${srcdir}/package/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
