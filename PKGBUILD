# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=lexconvert-git
_pkgname="${pkgname%-git}"
pkgver=0.39.r2.ge096c20
pkgrel=1
pkgdesc="Convert phoneme codes and lexicon formats for English speech synths"
arch=('any')
url="https://github.com/ssb22/lexconvert"
license=(Apache)
makedepends=('git')
depends=('python')
source=("$pkgname::git+$url.git" fix-pickle-import.patch)
sha256sums=('SKIP'
            'b47f10c5e6617479f3ed7f4f479331982f1572a871cdf5ce0a9e32cb8c5ea8f4')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    sed -i '/python2/d' Makefile.test
    git apply ../fix-pickle-import.patch
}

check() {
    cd "$pkgname"
    make --file=Makefile.test test
}

package() {
    cd "$pkgname"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
    install -Dm755 lexconvert.py "${pkgdir}/usr/bin/lexconvert"
}
