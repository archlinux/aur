# Maintainer: Allison Smith <alyway@protonmail.com>
# Contributor: Anthony Wang <ta180m@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Max Bruckner <max@maxbruckner.de>
# I could only get this working in java-11-openjdk, hence the depends

pkgname=terasology
_version=5.4.0
_version_postfix=alpha24
_version_postfix_secondary=rc.1
pkgver=${_version}${_version_postfix}
pkgrel=1
epoch=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64')
license=('Apache')
url="https://terasology.org"
options=('!strip')
depends=(zlib java-runtime-openjdk)
conflicts=(terasology-latest-bin)
makedepends=('unzip')
source=(
    "$pkgname"
    "${pkgname}.desktop"
    "TerasologyOmega${pkgver}.zip::https://github.com/MovingBlocks/Terasology/releases/download/v${_version}-${_version_postfix_secondary}/TerasologyOmega.zip"
)
sha512sums=('b575b3e3bd5200794a9752ad6f96a147fd5af0196b7e81d1afb4358f9c4da1b656e5ad326cdeabf1be687f1ae69031d609420fc1df2001ef71a131068f2ef835'
            '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
            'd9162e48339caad270714818be3ff6e8588d12b6bac8662c0df2f378a1d51a67498750c0f503b41a6aa2065a63315ea0007d855f498f1e034d935d237977fda9')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega${pkgver}.zip"

    #extract and install icons
    unzip -u libs/engine-${_version}-SNAPSHOT.jar "org/terasology/engine/icons/*"
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
