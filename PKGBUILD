# Maintainer: Ainola
# Contributor: kozec

pkgname=minecraft-technic-launcher
# Find the latest version number at https://api.technicpack.net/launcher/version/stable4
pkgver=4.510
pkgrel=1
pkgdesc='Choose from thousands of community-made Minecraft modpacks.'
arch=('any')
license=('custom')
url='https://www.technicpack.net/'
depends=('java-runtime=8' 'xorg-xrandr' 'hicolor-icon-theme')
makedepends=('icoutils')
# bsdtar would fail with "can't replace existing directory with non-directory"
noextract=('TechnicLauncher.jar')
# HTTPS endpoint does not work as of 2019-08-25
source=("$pkgname-$pkgver.jar::http://launcher.technicpack.net/launcher${pkgver:0:1}/${pkgver:2}/TechnicLauncher.jar"
        "technic-launcher"
        "technic-launcher.desktop")
sha256sums=('9b71e501cd28b5da01fa71951cd17a1a8e8812904c3030cc0242d5c50b251ec4'
            '11e5cbc3ae9888865c34bec90ce725532a039aa751aefa61cd4703c9f0460397'
            '221da85f9fb535951e490a3feda052c60839883ae0806d7d587b0c64337f3513')

prepare() {
    bsdtar -xf "$pkgname-$pkgver.jar" licenses
    bsdtar -xf "$pkgname-$pkgver.jar" net/technicpack/launcher/resources/icon.ico
    icotool -x "net/technicpack/launcher/resources/icon.ico" -o .
}

package(){
    install -Dm755 technic-launcher "$pkgdir/usr/bin/technic-launcher"
    install -Dm644 "$pkgname-$pkgver.jar" \
        "$pkgdir/usr/share/java/$pkgname/technic-launcher.jar"


    # Desktop integration
    install -Dm644 technic-launcher.desktop -t "$pkgdir/usr/share/applications/"
    for size in 16 32 48 64; do
        install -D -m644 "icon_"?"_${size}x${size}x32.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/technic-launcher.png"
    done

    install -Dm644 licenses/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
