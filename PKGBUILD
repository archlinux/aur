# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: kozec

pkgname=minecraft-technic-launcher
pkgver=4.402
pkgrel=1
pkgdesc='Choose from thousands of community-made Minecraft modpacks.'
arch=('any')
license=('custom')
url='http://www.technicpack.net/'
depends=('java-runtime' 'xorg-xrandr' 'hicolor-icon-theme')
makedepends=('icoutils')
# bsdtar would fail with "can't replace existing directory with non-directory"
noextract=('TechnicLauncher.jar')
source=("$pkgname-$pkgver.jar::http://launcher.technicpack.net/launcher${pkgver:0:1}/${pkgver:2}/TechnicLauncher.jar"
        "technic-launcher"
        "technic-launcher.desktop")
sha256sums=('4ee5d729510e5ebc579276e26d487e967222b22de977f8bc7299a47b27b9a613'
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
