# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kurento-module-creator
pkgver=4.0.8
pkgrel=1
pkgdesc='Kurento module creator'
arch=('any')
url='http://www.kurento.org/'
license=('LGPL v2.1')
depends=('java-runtime')
makedepends=('cmake' 'java-environment' 'maven')
provides=(${pkgname})
conflicts=(${pkgname})
source=("https://github.com/Kurento/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7b0902f408062dc5b67ed7ac919cd118818c82276012c038823742a4cae1dff1')

build() {
    cd $srcdir/${pkgname}-${pkgver}

    for FILE in $(find . -type f)
    do
        sed -i -E "s/int64Value/intValue/g" $FILE
    done

    mvn compile
    mvn package
}
package() {
    cd $srcdir/${pkgname}-${pkgver}

    mkdir -p $pkgdir/usr/bin
    install -m 644 target/kurento-module-creator-jar-with-dependencies.jar $pkgdir/usr/bin
    install -m 755 scripts/kurento-module-creator $pkgdir/usr/bin
    for DIR in $(ls /usr/share/ | grep cmake-)
    do
        mkdir -p $pkgdir/usr/share/$DIR/Modules/
        install -m 644 target/classes/FindKurentoModuleCreator.cmake $pkgdir/usr/share/$DIR/Modules/
    done
}
