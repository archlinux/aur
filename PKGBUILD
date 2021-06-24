# Maintainer: PY Chuang <pychuang@pm.me>
pkgname=textlint-plugin-latex2e
pkgver=1.1.4
pkgrel=1
pkgdesc="Textlint Plugin LaTeX2ε"
arch=(any)
url="https://github.com/textlint/textlint-plugin-latex2e"
license=("GPL3")
depends=("nodejs" "textlint")
makedepends=("npm")
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=("f707cd3eea7f0cd8bd3fd8b36223dd2ffe2f53b9021ad98cd808c1794eecfa6d")

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

    # install README
    install -Dm644 "${srcdir}/package/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
