# Maintainer:  Ainola
# Contributor: kozec

pkgname=minecraft-technic-launcher
pkgver=4.347
pkgrel=5
pkgdesc='Choose from thousands of community-made Minecraft modpacks available on the Technic Platform.'
arch=('any')
license=('custom')
url='http://www.technicpack.net/'
depends=('java-runtime' 'xorg-xrandr' 'hicolor-icon-theme')
makedepends=('icoutils')
# bsdtar would fail with "can't replace existing directory with non-directory"
noextract=('TechnicLauncher.jar')
source=("http://launcher.technicpack.net/launcher${pkgver:0:1}/${pkgver:2}/TechnicLauncher.jar"
        "technic-launcher"
        "technic-launcher.desktop")
sha256sums=('d9166ef07bb1a0880149b972d46c3e02599775132cf3125dd635b2ee714478b9'
            'bcf657996e45b436382f401457e35d834baa1e35c0c483e7918ab6f93a2252c1'
            'bfea4300dc48adeb726b49125d05b5e65ed368cf08910ced970b1f1c571c4ecd')
package(){
    cd "$srcdir"
    install -D -m755 "${srcdir}/technic-launcher" "${pkgdir}/usr/bin/technic-launcher"
    install -D -m644 "${srcdir}/TechnicLauncher.jar" "${pkgdir}/usr/share/technic-launcher/technic-launcher.jar"

    # Desktop integration
    install -D -m644 "${srcdir}/technic-launcher.desktop" "${pkgdir}/usr/share/applications/technic-launcher.desktop"
    bsdtar -xf TechnicLauncher.jar net/technicpack/launcher/resources/icon.ico
    icotool -x -o "$srcdir" "${srcdir}/net/technicpack/launcher/resources/icon.ico"
    for size in 16 32 48 64; do
        install -D -m644 "${srcdir}/icon_"?"_${size}x${size}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/technic-launcher.png"
    done

    # Currently there is an issue with libarchive that prohibits extraction.
    # See https://github.com/libarchive/libarchive/issues/822. Once a new
    # release is issued, this can be uncommented again.

    #bsdtar xf TechnicLauncher.jar licenses
    #mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    #install -Dm644 licenses/* "$pkgdir/usr/share/licenses/$pkgname/"
}
