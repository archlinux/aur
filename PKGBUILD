# Maintainer: soloturn@gmail.com
# Contributor: Allison Smith <alyway@protonmail.com>
# Contributor: Anthony Wang <ta180m@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Max Bruckner <max@maxbruckner.de>

pkgname=terasology-latest-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="Yet another high resolution game with blocks like Minecraft!"
arch=('x86_64')
license=('Apache-2.0')
url="https://terasology.org"
options=('!strip')
depends=(zlib java-runtime-openjdk)
makedepends=('unzip')
source=(
    "terasology"
    "terasology.desktop"
    "terasology-omega-${pkgver}.zip::https://jenkins.terasology.io/job/Terasology/job/Omega/job/develop/lastSuccessfulBuild/artifact/distros/omega/build/distributions/TerasologyOmega.zip"
)
sha512sums=(
  'SKIP'
  '737953ab10027100b6bd03ca60a3f1cd4fff503c4c5a1689b3e12ef8df66a3e3347c99d498e48dccc3be8d00e9e37fcab56d5c97bbb81dd310ce757979aa0276'
  'SKIP'
  )

package() {
    install -Dm 755 "${srcdir}/terasology" "$pkgdir/usr/bin/terasology"
    install -Dm 644 "${srcdir}/terasology.desktop" "${pkgdir}/usr/share/applications/terasology.desktop"

    #cleanup
    rm "${srcdir}/terasology" "${srcdir}/terasology.desktop" "${srcdir}/terasology-omega-${pkgver}.zip"

    #extract and install icons
    unzip -u libs/engine-${pkgver}-SNAPSHOT.jar "org/terasology/engine/icons/*"
    pushd org/terasology/engine/icons
    for icon in *
    do
        size=${icon##*_}        #gooey_sweet_XX.png -> XX.png
        size=${size/.png/}      #XX.png -> XX
        install -Dm 644 "$icon" "${pkgdir}/usr/share/icons/${size}x${size}/apps/terasology.png"
    done
    install -Dm 644 "${pkgdir}/usr/share/icons/64x64/apps/terasology.png" "${pkgdir}/usr/share/pixmaps/terasology.png"
    popd
    rm -r org

    #remove files/dirs for other operating systems and native libraries
    #rm run_macosx.command Terasology.{x86,x64}.exe
    rm Terasology.bat
    rm -r natives/macosx
    rm -r natives/windows
    strip -s natives/linux/libbullet-linux-amd64.so
    
    chmod a+w "$srcdir" # Terrible permissions hack to get the game to start
    cp -ra "$srcdir" "${pkgdir}/usr/share/terasology"
    
}
