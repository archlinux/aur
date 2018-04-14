# Maintainer: Alexander Susha <isushik94@gmail.com>
pkgname=kurento-module-creator
pkgver=6.7.0
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
sha256sums=('e14236601cd098dcb4039cabf757ea1b47a7f8c9a6c937be7fe5600bd3e9cdb2')

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
