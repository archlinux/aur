# Maintainer: Jason Stryker <public at jasonstryker dot com>

pkgname=runelite-launcher
pkgver=2.1.0
pkgrel=1
pkgdesc="Open source Old School RuneScape client. (Launcher with auto-update)"
arch=(any)
license=('BSD')
url="https://github.com/runelite/launcher"
depends=('java-environment>=11')
optdepends=('gvfs: enable links')
makedepends=('maven' 'imagemagick')
source=("${url}/archive/${pkgver}.tar.gz"
        runelite-launcher.desktop)
sha512sums=('a1e06ca8be7ca08c33f1408bb61449ff3c0106f4cf985201d8e666d4304a52f163ec413a428da992ac1ee4b731002d1b7f92d9e785cdb31d9999bdeb6920dfa0'
            'db548f7e675a1aabc8a97d40dc3f8f59f14fe55826e80faf95df1c957b6ae0cc40514998141a0e7fb5eb456a53a1fd298ea31cb97b6584487147ada7190668b7')

build() {
    cd ${srcdir}/launcher-${pkgver}

    sed -i 's/http:\/\/repo1.maven.org/https:\/\/repo1.maven.org/g' pom.xml

    mvn clean package -DskipTests=true
    
    convert runelite.ico runelite.png
}

package() {
    install -D -m644 \
        "${srcdir}/launcher-${pkgver}/target/RuneLite.jar" \
        "${pkgdir}/usr/share/runelite-launcher/Launcher.jar"

    install -D -m644 \
        "${srcdir}/runelite-launcher.desktop" \
        "${pkgdir}/usr/share/applications/runelite-launcher.desktop"

    install -D -m644 \
        "${srcdir}/launcher-${pkgver}/runelite-4.png" \
        "${pkgdir}/usr/share/pixmaps/runelite-launcher.png"

    install -D -m644 \
        "${srcdir}/launcher-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}"

    install -D -m755 \
        "/dev/null" \
        "${pkgdir}/usr/bin/runelite-launcher"

    echo '#!/bin/sh' > "${pkgdir}/usr/bin/runelite-launcher"
    echo 'exec java -Dhttps.protocols=TLSv1.2 -jar /usr/share/runelite-launcher/Launcher.jar "$@"' >> "${pkgdir}/usr/bin/runelite-launcher"
}
