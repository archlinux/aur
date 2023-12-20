# Maintainer: Gesh <gesh@gesh.uni.cx>

pkgname=lexconvert-git
_pkgname="${pkgname%-git}"
pkgver=0.39.r2.ge096c20
pkgrel=3
pkgdesc="Convert phoneme codes and lexicon formats for English speech synths"
arch=('any')
url="https://github.com/ssb22/lexconvert"
license=(Apache)
makedepends=('git' 'dos2unix')
depends=('python')
# NOTE: Considering these require MacOS system voice resources at hardcoded
# paths, it is highly unlikely this optdepend is useful. Keeping it around
# mostly for documentation purposes.
optdepends=('python2: for mac and mac-uk formats')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    sed -i '/python2/d' Makefile.test
    dos2unix lexconvert.py
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
