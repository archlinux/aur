# Maintainer: soloturn@gmail.com
# Contributor: Allison Smith <alyway@protonmail.com>
# Contributor: Anthony Wang <ta180m@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Max Bruckner <max@maxbruckner.de>

_pkgbase=terasology
pkgname=terasology-latest-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64')
license=('Apache')
url="https://terasology.org"
options=('!strip')
depends=(zlib java-runtime-openjdk)
makedepends=('unzip')
source=(
    "$_pkgbase"
    "${_pkgbase}.desktop"
    "terasology-omega-${pkgver}.zip::https://jenkins.terasology.io/job/Terasology/job/Omega/job/develop/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip"
)
sha512sums=(
  'SKIP'
  '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
  'SKIP'
  )

package() {
    cd "$srcdir"
    install -Dm 755 "${srcdir}/${_pkgbase}" "$pkgdir/usr/bin/${_pkgbase}"
    install -Dm 644 "${srcdir}/${_pkgbase}.desktop" "${pkgdir}/usr/share/applications/${_pkgbase}.desktop"

    #cleanup
    rm "${srcdir}/${_pkgbase}" "${srcdir}/${_pkgbase}.desktop" "${srcdir}/terasology-omega-${pkgver}.zip"

    #extract and install icons
    unzip -u libs/engine-${pkgver}-SNAPSHOT.jar "org/terasology/engine/icons/*"
    pushd org/terasology/engine/icons
    for icon in *
    do
        size=${icon##*_}        #gooey_sweet_XX.png -> XX.png
        size=${size/.png/}      #XX.png -> XX
        install -Dm 644 "$icon" "${pkgdir}/usr/share/icons/${size}x${size}/apps/${_pkgbase}.png"
    done
    install -Dm 644 "${pkgdir}/usr/share/icons/64x64/apps/${_pkgbase}.png" "${pkgdir}/usr/share/pixmaps/${_pkgbase}.png"
    popd
    rm -r org

    #remove files/dirs for other operating systems and native libraries
    #rm run_macosx.command Terasology.{x86,x64}.exe
    rm Terasology.bat
    rm -r natives/macosx
    rm -r natives/windows
    strip -s natives/linux/libbullet-linux-amd64.so
    
    chmod a+w "$srcdir" # Terrible permissions hack to get the game to start
    cp -ra "$srcdir" "${pkgdir}/usr/share/${_pkgbase}"
    
}
