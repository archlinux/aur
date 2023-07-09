# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor: Anthony Wang <ta180m@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Max Bruckner <max@maxbruckner.de>
# I could only get this working in java-11-openjdk, hence the depends

pkgname=terasology
_version=5.3.0
_version_postfix=alpha23
pkgver=${_version}${_version_postfix}
pkgrel=1
epoch=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64')
license=('Apache')
url="https://terasology.org"
options=('!strip')
depends=(zlib java-runtime-openjdk=11)
makedepends=('unzip')
source=(
    "$pkgname"
    "${pkgname}.desktop"
    "TerasologyOmega${pkgver}.zip::https://github.com/MovingBlocks/Terasology/releases/download/v${_version}/TerasologyOmega.zip"
)
sha512sums=('a4764c3d5fdbf080b48e5de358f7162b334b4ca88e1249975d2d378f649a2a5fbdb8823d960a5167e9fd39745966efb4a597f3195207be0bf80cec810a4dff50'
            '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
            'cddc836c6704810b0c9025828d0ed35ea55d5024598a4b022dc2f6332c55ddf416cfd07852e599d9deefee5d1012e82ae8488a727422e05dd20194799473317d')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega${pkgver}.zip"

    #extract and install icons
    unzip -u libs/engine-${_version}.jar "org/terasology/engine/icons/*"
    pushd org/terasology/engine/icons
    for icon in *
    do
        size=${icon##*_}        #gooey_sweet_XX.png -> XX.png
        size=${size/.png/}      #XX.png -> XX
        install -Dm 644 "$icon" "${pkgdir}/usr/share/icons/${size}x${size}/apps/${pkgname}.png"
    done
    install -Dm 644 "${pkgdir}/usr/share/icons/64x64/apps/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    popd
    rm -r org

    #remove files/dirs for other operating systems and native libraries
    #rm run_macosx.command Terasology.{x86,x64}.exe
    rm Terasology.bat
    rm -r natives/macosx
    rm -r natives/windows
    strip -s natives/linux/libbullet-linux-amd64.so
    
    chmod a+w "$srcdir" # Terrible permissions hack to get the game to start
    cp -ra "$srcdir" "${pkgdir}/usr/share/${pkgname}"
    
}
