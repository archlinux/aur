# Maintainer:  Ainola
# Contributor: kozec

pkgname=minecraft-technic-launcher
pkgver=4.349
pkgrel=1
pkgdesc='Choose from thousands of community-made Minecraft modpacks available on the Technic Platform.'
arch=('any')
license=('custom')
url='http://www.technicpack.net/'
depends=('java-runtime' 'xorg-xrandr' 'hicolor-icon-theme')
makedepends=('icoutils')
# bsdtar would fail with "can't replace existing directory with non-directory"
noextract=('TechnicLauncher.jar')
source=("$pkgname-$pkgver.jar"::"http://launcher.technicpack.net/launcher${pkgver:0:1}/${pkgver:2}/TechnicLauncher.jar"
        "technic-launcher"
        "technic-launcher.desktop")
sha256sums=('4baea53397e150ada1ff9e2442724b8ff52190ae4dac200612eef4671e9563ca'
            '16386e5284409af1106c254c432a623ff35108f1480423b48f57247f0fd755c7'
            'bfea4300dc48adeb726b49125d05b5e65ed368cf08910ced970b1f1c571c4ecd')
package(){
    cd "$srcdir"
    install -D -m755 "${srcdir}/technic-launcher" "${pkgdir}/usr/bin/technic-launcher"
    install -D -m644 "$srcdir/$pkgname-$pkgver.jar" "${pkgdir}/usr/share/technic-launcher/technic-launcher.jar"


    # Desktop integration
    install -D -m644 "${srcdir}/technic-launcher.desktop" "${pkgdir}/usr/share/applications/technic-launcher.desktop"
    bsdtar -xf "$pkgname-$pkgver.jar" net/technicpack/launcher/resources/icon.ico
    icotool -x -o "$srcdir" "${srcdir}/net/technicpack/launcher/resources/icon.ico"
    for size in 16 32 48 64; do
        install -D -m644 "${srcdir}/icon_"?"_${size}x${size}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/technic-launcher.png"
    done

    bsdtar xf "$pkgname-$pkgver.jar" licenses
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 licenses/* "$pkgdir/usr/share/licenses/$pkgname/"
}
