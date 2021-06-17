# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: CubeTheThird <cubethethird@gmail.com>

pkgname=amidst
_version='4.7'
pkgver=${_version//_/-}
_jarver="v${_version}"
_jarfile="${pkgname}-${_jarver/./-}.jar"
pkgrel=1
pkgdesc='Advanced Minecraft Interface and Data/Structure Tracking'
arch=('any')
license=('GPL3')
url='https://github.com/toolbox4minecraft/amidst'
depends=('java-runtime=8' 'sh' 'hicolor-icon-theme')
optdepends=('minecraft: the game itself' 'minecraft-launcher: The new game launcher')
noextract=("$_jarfile")
changelog=ChangeLog
source=("https://github.com/toolbox4minecraft/amidst/releases/download/$_jarver/$_jarfile"
        amidst.desktop)
b2sums=('f23510c32b970206593acd430e6efaf656df012630b72577e438af67be1e0d32d6d5308c1da04cb23e5823aef3b7a91c59046d07c0df5a56e6554ebdb09e2e5c'
        '03c585137d786adbb07c311c9d1002161a7ad56b1a327c8c04eac8907c9d102c48e9434ee48de37b3cb91bdffcdcf053e8e57b3c852a2129c7795b70042d6f35')

prepare() {
    bsdcpio -i -m --quiet --make-directories '*/amidst-*.png' < "$_jarfile"
}

build() {
    cd "$srcdir"

    #Create shell script to launch the application
    echo "#!/bin/sh" > amidst.sh
    echo "java -noverify -jar /usr/share/java/$pkgname/AMIDST.jar" >> amidst.sh
}

package() {
    cd "$srcdir"

    install -Dm755 'amidst.sh'                 "$pkgdir/usr/bin/amidst"
    install -Dm644 'amidst.desktop'            "$pkgdir/usr/share/applications/amidst.desktop"
    install -Dm644 "$_jarfile"                 "$pkgdir/usr/share/java/$pkgname/AMIDST.jar"

    icon_sizes=(16 32 48 64 128 256)
    for s in "${icon_sizes[@]}"; do
        install -Dm644 "amidst/icon/amidst-${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/amidst.png"
    done
}

# vim:set ts=4 sw=4 et:
