# Maintainer: David Pugnasse <david.pugnasse@gmail.com>
pkgname=pmd
pkgver=5.2.3
pkgrel=1
pkgdesc="A java source code scanner for detecting possible bugs, dead code, overcomplicated expressions and more"
arch=('any')
url="http://pmd.sourceforge.net/"
license=('custom:BSD-style' 'Apache')
depends=('java-environment')
makedepends=('maven' 'unzip')
checkdepends=('maven')
source=(
    "http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-src-$pkgver.zip"
    run.patch
)
md5sums=(
    'c468e0f3e2ec85bd6decda5a4570e4ec'
    'd565ff42cfcb1110dc74c504b9a619ec'
)
_M2_REPO=repo

prepare() {
    test -d "$_M2_REPO" || mkdir "$_M2_REPO"
    cd "$pkgname-src-$pkgver"
    mvn -Dmaven.repo.local="$srcdir/$_M2_REPO" \
        -Dmaven.test.skip=true \
        clean \
        validate

    patch -p1 -d "$pkgname-dist/src/main/scripts" < ../run.patch
}

build() {
    cd "$pkgname-src-$pkgver"
    mvn -Dmaven.repo.local="$srcdir/$_M2_REPO" \
        -Dmaven.test.skip=true \
        compile

    for BIN in bgastviewer cpd cpdgui pmd pmd-designer; do
        printf "#%c/bin/sh\nexec /usr/bin/$pkgname-run $BIN \"\$@\"\n" ! > "../$BIN"
    done
}

check() {
    cd "$pkgname-src-$pkgver"
    mvn -Dmaven.repo.local="$srcdir/$_M2_REPO" \
        test
}

package() {
    cd "$pkgname-src-$pkgver"
    mvn -Dmaven.repo.local="$srcdir/$_M2_REPO" \
        -Dmaven.test.skip=true \
        verify
    unzip -o "$pkgname-dist/target/$pkgname-bin-$pkgver.zip" -d "$srcdir"

    cd "$srcdir/$pkgname-bin-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 bin/run.sh "$pkgdir/usr/bin/$pkgname-run"
    for BIN in bgastviewer cpd cpdgui pmd pmd-designer; do
        install -Dm755 "../$BIN" "$pkgdir/usr/bin/$BIN"
    done
    cd lib
    for JAR in *.jar; do
        install -Dm644 "$JAR" "$pkgdir/usr/share/java/$pkgname/$JAR"
    done
}
