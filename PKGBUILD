# Maintainer: Anthony Wang <ta180m@gmail.com>

pkgname=terasology
_version=4.3.0
_version_postfix=alpha19
pkgver=${_version}${_version_postfix}
pkgrel=1
epoch=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64' 'i686')
license=('Apache')
url="https://terasology.org"
options=('!strip')
depends=('java-environment-openjdk>=8' 'openal' 'libxcursor' 'libxxf86vm' 'libxrandr')
makedepends=('unzip')
source=(
    "$pkgname"
    "${pkgname}.desktop"
    "TerasologyOmega${pkgver}.zip::https://github.com/MovingBlocks/Terasology/releases/download/v${_version}/TerasologyOmega.zip"
)
sha512sums=('b575b3e3bd5200794a9752ad6f96a147fd5af0196b7e81d1afb4358f9c4da1b656e5ad326cdeabf1be687f1ae69031d609420fc1df2001ef71a131068f2ef835'
            '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
            '797c2330447e15c505e16b131e90db7a1ab4408ecf0569c419f51b3effed5fb203da3edad5195023685a0a4aafba336d589ac3b312eec2c0692776b673cb253d')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega${pkgver}.zip"

    #extract and install icons
    unzip -u libs/engine-${_version}.jar "org/terasology/icons/*"
    pushd org/terasology/icons
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
    #mkdir -p natives/linux

    #link the lwjgl libraries
    #ln -sf /usr/share/lwjgl2/native/linux/liblwjgl64.so natives/linux
    #ln -sf /usr/share/lwjgl2/native/linux/libjinput-linux64.so natives/linux
    #ln -sf /usr/share/lwjgl2/native/linux/liblwjgl.so natives/linux
    #ln -sf /usr/share/lwjgl2/native/linux/libjinput-linux.so natives/linux

    cp -ra "$srcdir" "${pkgdir}/usr/share/${pkgname}"
    # install -Dm 755 "${srcdir}" "$pkgdir/usr/share/${pkgname}"

    # Copy this file (not entirely sure about this, but doesn't start without it)
    #install -Dm 644 "${srcdir}/rendering.cfg" "${pkgdir}/usr/share/${pkgname}/configs/engine/rendering.cfg"
    #rm "${pkgdir}/usr/share/${pkgname}/rendering.cfg"
}
