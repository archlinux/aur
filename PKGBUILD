# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: CubeTheThird <cubethethird@gmail.com>

_pkgname=amidst
pkgname=${_pkgname}-beta
_version='4.4-beta1'
pkgver=${_version//-/_}
_jarver="v${_version}"
_jarfile="${_pkgname}-${_jarver/./-}.jar"
pkgrel=1
pkgdesc='Advanced Minecraft Interface and Data/Structure Tracking'
arch=('any')
license=('GPL3')
url='https://github.com/toolbox4minecraft/amidst'
depends=('java-runtime=8' 'sh')
optdepends=('minecraft: the game itself')
conflicts=("$_pkgname")
provides=("$_pkgname")
noextract=("$_jarfile")
changelog=ChangeLog
source=("https://github.com/toolbox4minecraft/amidst/releases/download/$_jarver/$_jarfile"
        amidst.desktop)
md5sums=('b48fe73ae5027d68ad8a3c0c1aeb5451'
         '3c6900ac68e3175768322e684f9f1bcb')

prepare() {
    bsdcpio -i -m --quiet --make-directories '*/amidst-*.png' < "$_jarfile"
}

build() {
    cd "$srcdir"

    #Create shell script to launch the application
    echo "#!/bin/sh" > amidst.sh
    echo "java -noverify -jar /usr/share/java/$_pkgname/AMIDST.jar" >> amidst.sh
}

package() {
    cd "$srcdir"

    install -Dm755 'amidst.sh'                 "$pkgdir/usr/bin/amidst"
    install -Dm644 'amidst.desktop'            "$pkgdir/usr/share/applications/amidst.desktop"
    install -Dm644 "$_jarfile"                 "$pkgdir/usr/share/java/$_pkgname/AMIDST.jar"

    icon_sizes=(16 32 48 64 128 256)
    for s in "${icon_sizes[@]}"; do
        install -Dm644 "amidst/icon/amidst-${s}x${s}.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/amidst.png"
    done
}

# vim:set ts=4 sw=4 et:
