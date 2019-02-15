# Maintainer: Jason Stryker <public at jasonstryker dot com>
pkgname=runelite-launcher
pkgver=1.6.2
pkgrel=1
pkgdesc="Open source Old School RuneScape client. (Launcher with auto-update)"
arch=(any)
license=('BSD')
url="https://github.com/runelite/launcher"
depends=('java-runtime>=8' 'bash' 'ttf-font')
optdepends=('gvfs: enable links')
makedepends=('maven' 'imagemagick')
noextract=('runelite.jar')
source=("${url}/archive/${pkgver}.tar.gz"
        runelite-launcher        
        runelite-launcher.desktop)
sha512sums=('c5d089b5e2d278c4536b474b47069f6dfc513c2bff12d7c3f6ea27b706902f5a31112e00b1fa36a3bcd43e7d77a867bc3a31f43a4e0490e2ad1a1e105ece19a6'
            'c1743cc010e8207ed6c2304e083b700281cffd97a952fcc67c538b2fd99750bba06f2c7776d19f433d26f4ece5ade5dcd4dd3f3d1a53a4ea1edfde3bec6eb4a5'
            'db548f7e675a1aabc8a97d40dc3f8f59f14fe55826e80faf95df1c957b6ae0cc40514998141a0e7fb5eb456a53a1fd298ea31cb97b6584487147ada7190668b7')

build() {
    cd ${srcdir}/launcher-${pkgver}

    mvn clean package \
        -Dmaven.repo.local="${srcdir}/repo" \
        -DskipTests=true
    
    convert runelite.ico runelite.png
}

package() {
    install -D -m644 \
        "${srcdir}/launcher-${pkgver}/target/RuneLite.jar" \
        "${pkgdir}/usr/share/runelite-launcher/Launcher.jar"

    install -D -m755 \
        "${srcdir}/runelite-launcher" \
        "${pkgdir}/usr/bin/runelite-launcher"

    install -D -m644 \
        "${srcdir}/runelite-launcher.desktop" \
        "${pkgdir}/usr/share/applications/runelite-launcher.desktop"

    install -D -m644 \
        "${srcdir}/launcher-${pkgver}/runelite-4.png" \
        "${pkgdir}/usr/share/pixmaps/runelite-launcher.png"

    install -D -m644 \
        "${srcdir}/launcher-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}"
}
