# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=textlint-plugin-typst
pkgver=1.3.0
pkgrel=1
pkgdesc="Textlint plugin to lint Typst"
arch=(any)
url="https://github.com/textlint/textlint-plugin-typst"
license=("MIT")
depends=("nodejs" "textlint")
makedepends=("npm")
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('2210e015ccc0cd8ebcc44e15cd42ea1a4a59752edc132be8242c261406d9187d')

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
        --prefix "$pkgdir/usr" \
        $pkgname-$pkgver.tgz

    # change the destination of references
    grep -Rl "$pkgdir" "$pkgdir" | xargs -r sed -i "s@${pkgdir}@@g"
    grep -Rl "$srcdir" "$pkgdir" | xargs -r sed -i "s@\"${srcdir}.*\"@\"\"@g"

    # change owner
    chown -R root:root "${pkgdir}"

    # MIT needs to install LICENSE files
    install -Dm644 "${srcdir}/package/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

    # install README
    install -Dm644 "${srcdir}/package/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
