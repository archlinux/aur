# Maintainer: David Pugnasse <david.pugnasse@gmail.com>
pkgname=pmd
pkgver=6.1.0
pkgrel=1
pkgdesc="An extensible cross-language static code analyzer."
arch=('any')
url="http://pmd.github.io"
license=('BSD' 'Apache')
depends=('java-environment')
makedepends=('java-environment-common' 'maven')
source=("https://github.com/$pkgname/$pkgname/releases/download/${pkgname}_releases/$pkgver/$pkgname-src-$pkgver.zip"
        pmdapp)
md5sums=('0f7ac91b14d57b18bf4c2192ce5c8152'
         '170b76a131d4651f24213f273164d175')

build() {
    cd "$pkgname-src-$pkgver"

    sh mvnw clean package -DskipTests=true -Dmaven.javadoc.skip=true
    bsdtar -xzf pmd-dist/target/pmd-bin-6.1.0.zip --strip-components 1 pmd-bin-6.1.0/lib
}

package() {
    cd "$pkgname-src-$pkgver"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for app in pmd-bgastviewer pmd-cpd pmd-cpdgui pmd-designer pmd-designerold pmd; do
        install -Dm755 "../pmdapp" "$pkgdir/usr/bin/$app"
    done

    cd lib
    for file in *.jar; do
        install -Dm644 "$file" "$pkgdir/usr/share/java/$pkgname/$file"
    done
}
