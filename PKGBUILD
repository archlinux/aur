pkgname=terasology
pkgver=65
_omega_ver=22
pkgrel=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64' 'i686')
license=('Apache')
url="http://terasology.org"
options=('!strip')
depends=('java-environment-openjdk=8' 'xorg-server-utils' 'openal')
makedepends=('unzip')
source=(
    "$pkgname"
    "${pkgname}.desktop"
    "http://jenkins.movingblocks.net/job/DistroOmegaRelease/${_omega_ver}/artifact/distros/omega/build/distributions/TerasologyOmega.zip"
)
sha512sums=('f94c1ac3d85e4fb91cc47056eeec3648d02be9090252401acb740af8c0580623c7ee57470d9e7317d6b577d613e317b5c16ec014f232ec68bc755e0eba7a975e'
            '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
            'd856974284ba495d1e81785b428e81be254968147531bcbed0820a4794aa96f654bf103b613335408dd73aab828efc1fc23a4e19acfd982cc53556be5675644e')

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    #cleanup
    rm "${srcdir}/${pkgname}" "${srcdir}/${pkgname}.desktop" "${srcdir}/TerasologyOmega.zip"

    #extract and install icons
    unzip -u libs/engine-* "org/terasology/icons/*"
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

    #remove files/dirs for other operating systems
    rm run_macosx.command Terasology.{x86,x64}.exe
    rm -r natives/{macosx,windows}

    cp -ra "$srcdir" "${pkgdir}/usr/share/${pkgname}"
}
