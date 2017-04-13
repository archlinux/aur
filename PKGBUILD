# Maintainer: Lucien LOISEAU (Marlinski) <marlinski@disruptedsystems.org>

pkgname=blucat
pkgver=0.91
pkgrel=1
pkgdesc='The netcat for Bluetooth!'
arch=('i686' 'x86_64')
url='http://blucat.sourceforge.net/blucat/'
license=('GPL2')
depends=(java-runtime bluez bluez-utils bluez-libs java-commons-io)
makedepends=(java-environment-common apache-ant)
provides=(blucat)

source=(
    git://github.com/ieee8023/blucat
    http://snapshot.bluecove.org/distribution/download/2.1.1-SNAPSHOT/2.1.1-SNAPSHOT.63/bluecove-2.1.1-SNAPSHOT.jar
    blucat.sh
    build.xml
)
noextract=(
    bluecove-2.1.1-SNAPSHOT.jar
)
sha512sums=(
    'SKIP'
    cae92c40082e1c5268fc9893dfef2ffffe99ce3fc02fcba4578bfcd9b923ff26437555c6244d25fd6cf58fff78e1ca308505fb0fbb5c18bf4a0db1ddf8b737c8
    b58eb2595f66ebb97a99e97f4fc5115ee7649b75771adea42e8bc3a5de011c7c18017c70cbd84225533e59384443eefb46b006f600300a95fa00e9b35e17d7f2
    7c663dc39e3f76f9f8bc16b5a7135aae8c1d5b4d59eaf84012848b2c64b3534ecd5ff82936420a28002e71a5396fc72b7d101e07df2a1a1da76b5b9ce292b5f5
)

prepare() {
    # sanitize dependencies, it will be easier later to package them
    # NOTE: there is a blucove package in AUR but blucat requires the snapshot
    cd ${pkgname}
    rm -rf lib
    mkdir lib
    mv ../bluecove-2.1.1-SNAPSHOT.jar lib/

    # change the build.xml to a more cleaner version which also point to the right libraries (commons-io and bluecove)
    rm build.xml
    mv ../build.xml ./
}

build() {
    cd ${pkgname}
    ant jar
}

package() {
    install -d -m755 ${pkgdir}/usr/share/java/${pkgname}
    install -d -m755 ${pkgdir}/usr/bin
    install    -m644 ${pkgname}/lib/bluecove-2.1.1-SNAPSHOT.jar "${pkgdir}/usr/share/java/${pkgname}/"    
    install    -m644 ${pkgname}/build/${pkgname}.jar            "${pkgdir}/usr/share/java/${pkgname}/"    
    install -T -m755 blucat.sh "${pkgdir}/usr/bin/blucat"
}
