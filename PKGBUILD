# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: CubeTheThird <cubethethird@gmail.com>

_pkgname=amidst
pkgname=${_pkgname}-beta
_version='4.7'
pkgver=${_version//-/_}
_jarver="v${_version}"
_jarfile="${_pkgname}-${_jarver/./-}.jar"
pkgrel=2
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
b2sums=('f23510c32b970206593acd430e6efaf656df012630b72577e438af67be1e0d32d6d5308c1da04cb23e5823aef3b7a91c59046d07c0df5a56e6554ebdb09e2e5c'
        'e20cb58407016cbec9433191f39de3d890c6bbc7b6f38fc73525cb94c83b6ed1e136a4f1ddc8ac2c82cb72d674d0f95dc04be1911b254260e2ef130a8eefb758')

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
