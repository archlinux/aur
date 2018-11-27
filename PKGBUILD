# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: David Pugnasse <david.pugnasse@gmail.com>
pkgname=pmd
pkgver=6.9.0
pkgrel=1
pkgdesc="An extensible cross-language static code analyzer."
arch=('any')
url="https://pmd.github.io/"
license=('BSD' 'Apache')
depends=('java-environment=11')
makedepends=('java-environment-common' 'maven')
source=("https://github.com/$pkgname/$pkgname/releases/download/${pkgname}_releases/$pkgver/$pkgname-src-$pkgver.zip"
        pmdapp)
sha256sums=('9c89cb142d374c8fc4caab4230e215ddbd622bf5a87efb358ac19972a367d42c'
            'b1a73343ba0435801ce18c7fc18e14b7fed6a9be7b0a5907b67730471c176fc8')

build() {
    cd "$pkgname-src-$pkgver"

    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
    # exclude pmd-ui since no OpenJDK JavaFX 10 is currently packaged
    sh mvnw clean package -DskipTests=true -Dmaven.javadoc.skip=true --projects !pmd-ui
    bsdtar -xzf pmd-dist/target/pmd-bin-${pkgver}.zip --strip-components 1 pmd-bin-${pkgver}/lib
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
