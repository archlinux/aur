# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=textlint-rule-preset-jtf-style
pkgver=3.0.3
pkgrel=1
pkgdesc="Textlint rule preset for JTF style guide"
arch=(any)
url="https://github.com/textlint-ja/textlint-rule-preset-JTF-style"
license=("MIT")
depends=("nodejs" "textlint")
makedepends=("npm")
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=('daaa2d2a3c51ba2f9a9d2e2af47bcba504aefb03f57c5fa7377408bdae13f680')

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
