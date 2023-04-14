# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgname=crystal-launcher
pkgver=20230406
pkgrel=1
pkgdesc="A custom Minecraft launcher with its own package system"
arch=(any)
url="https://crystal-launcher.net/"
license=('unknown')

# Current reverse engineering for figuring out the jar:
# 1. curl the current script:
#        https://bit.ly/cl4lx
#        ->
#        https://launcher.crystal-launcher.net/linux/install.sh
#    Here we can find the launcher icon.
# 2. Fetch the launcher.tar.xz mentioned there
# 3. The 'launcher' binary inside is a PyInstaller package.
#    It can be unpacked via:
#        https://github.com/extremecoders-re/pyinstxtractor
#    There is the web version here:
#        https://pyinstxtractor-web.netlify.app/
# 4. Unpack the .zip file, it has a bunch of .pyc files.
#    You can decompile it via pycdc.
#    Focus on the Crystal*.pyc.
#    The main manifest is available here:
#        https://launcher.crystal-launcher.net/bootstrapNX/data/bootstrapManifest.json
#    It also stores the Java version to use
# 5. We have the proper JAR and command line path for the launcher.

_java_version="17"
depends=(
    "java-runtime=${_java_version}"
    "java${_java_version}-openjfx"
)
install="$pkgname.install"
source=("$pkgname.jar::https://launcher.crystal-launcher.net/bootstrapNX/data/crystal-wrapper.jar"
        "$pkgname.png::https://launcher.crystal-launcher.net/linux/icon.png"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('e9eacb799ed31b66854eb9266e126719b83afcb11e586181e9ddc19ded6c10e3'
            '214f4f12eb772d2ce945723ab7b126b1fb3e78c009f4132d6b0f98ea2270ab0c'
            '68a357836068f9382f96d8a858f664908d3e6dceb5246d4c34dcfb9b3495bdb6'
            'ff160d4a4cfe366f0ec806d7eeeac4bfd5e83c3d01afbc22ecc5caa1adb247ef')

package() {
    cd "$srcdir"

    mkdir -p "$pkgdir/usr/share/java"
    cp -v "$pkgname.jar" "$pkgdir/usr/share/java"

    mkdir -p "$pkgdir/usr/bin"
    cp -v  "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdir/usr/share/applications"
    cp -v "$pkgname.desktop" "$pkgdir/usr/share/applications"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    cp -v "$pkgname.png" "$pkgdir/usr/share/pixmaps"
}
