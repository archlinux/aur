# $Id: PKGBUILD 205029 2014-02-03 10:47:53Z bpiotrowski $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=bcprov151
pkgver=1.52
pkgrel=1
pkgdesc="Java cryptography APIs (Bouncy Castle)"
arch=('any')
url="http://www.bouncycastle.org/java.html"
license=('MIT')
depends=('java-runtime')
makedepends=('java-environment')
conflicts=('bcprov')
provides=('bcprov')
source=("http://bouncycastle.org/download/bcprov-jdk15on-152.tar.gz")
md5sums=('97abab944f1095c15bc4584726ec98c1')

prepare() {
    cd "$srcdir/bcprov-jdk15on-${pkgver/./}"

    jar xf src.zip
    rm -rf test

    local RM_TEST_FILES=()
    while read -d $'\0' -r file; do
        RM_TEST_FILES+=("${file}")
    done < <(find . -name "*Test*.java" -type f -print0)
    while read -d $'\0' -r file; do
        RM_TEST_FILES+=("${file}")
    done < <(find . -name "*Mock*.java" -type f -print0)
    rm -f "${RM_TEST_FILES[@]}"

    mkdir classes
    find . -name '*.java' >src.list
}

build() {
    cd "$srcdir/bcprov-jdk15on-${pkgver/./}"

    javac -encoding ISO-8859-1 -d classes @src.list

    cd classes
    find . -depth -type d -empty -delete
    install -m644 ../org/bouncycastle/x509/*.properties org/bouncycastle/x509/
    jar cf ../bcprov.jar *
}

package() {
    cd "$srcdir/bcprov-jdk15on-${pkgver/./}"

    install -m755 -d "${pkgdir}/usr/share/java"
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 bcprov.jar "${pkgdir}/usr/share/java/"
    install -m644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}
