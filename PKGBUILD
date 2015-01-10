# Maintainer: James An <james@jamesan.ca>
# Contributor: David Pugnasse <david.pugnasse@gmail.com>

_pkgname=pmd
pkgname="$_pkgname-bin"
pkgver=5.2.3
pkgrel=2
pkgdesc="A java source code scanner for detecting possible bugs, dead code, overcomplicated expressions and more"
arch=('any')
url="http://pmd.sourceforge.net/"
license=('custom:BSD-style' 'Apache')
depends=('java-environment')
makedepends=('unzip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$pkgver/$_pkgname-bin-$pkgver.zip"
    run.patch
)
md5sums=(
    'b66632f523cbeef93dd3c820f7007a4a'
    '764732c9d41b5f2d7d15af1f7f819f27'
)

prepare() {
    patch -p1 -d "$_pkgname-bin-$pkgver/bin" < run.patch
}

build() {
    for BIN in bgastviewer cpd cpdgui pmd pmd-designer; do
        printf "#%c/bin/sh\nexec /usr/bin/$_pkgname-run $BIN \"\$@\"\n" ! > "$BIN"
    done
}

package() {
    cd "$_pkgname-bin-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 bin/run.sh "$pkgdir/usr/bin/$_pkgname-run"
    for BIN in bgastviewer cpd cpdgui pmd pmd-designer; do
        install -Dm755 "../$BIN" "$pkgdir/usr/bin/$BIN"
    done
    cd lib
    for JAR in *.jar; do
        install -Dm644 "$JAR" "$pkgdir/usr/share/java/$_pkgname/$JAR"
    done
}
