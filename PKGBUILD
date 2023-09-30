# Maintainer: William Tang <galaxyking0419@gmail.com>

pkgname=unreal-engine-bin
pkgver=5.3.1
pkgrel=1
pkgdesc="The world's most open and advanced real-time 3D creation tool"
arch=('x86_64')
url='https://www.unrealengine.com/'
license=('custom')
conflicts=('unreal-engine' 'unreal-engine-4' 'unreal-engine-git')
provides=('unreal-engine=5.2')
depends=('alsa-lib' 'at-spi2-core' 'glu' 'libicu53' 'libxkbcommon' 'lttng-ust2.12' 'ncurses5-compat-libs' 'nss' 'pango' 'vulkan-driver')
optdepends=('android-ndk: Android build support'
            'clion: CLion IDE support'
            'code: Visual Studio Code IDE support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the zip file manually from https://www.unrealengine.com/linux')
source=("manual://Linux_Unreal_Engine_${pkgver}.zip" 'unreal-engine.desktop' 'unreal-engine.xml' {16,24,32,48,64,256}.png)
sha256sums=('e347441ce64c482bbdef5121fd6b2b540446460c871123faa9764920bb09dce9'
            '8a71e10dee1d44ad6f85d993bdf25dd4835f6415e983125ac79a912ee0c3d905'
            '752dc3628639adb84ebda281040ec106227431eb7a5f92375511d96c6ceacf91'
            '16197bc88f2ec77ad2690fae280bf3584c54c7d7b018d8fa4086b7c00fd4effc'
            'b6f068b2ff5f3831494b913e9bfff69349c88087205579a6b9a96c167e524e60'
            'c10cdd1b627ee53548140c4a255032d39dfb0039413b5c1b9765a1fa0d3f27a9'
            '521e6a42b587f6e9b964ba2a14c93bfadd94f1f06a2560ed09a7e7dd5043c61e'
            '7a96ab7db1fa191a6bd087497c2f55239d7cda01dcc226e742daa80c5bc37de2'
            '2399dfb472a6c753447b847fbb144235145ca6507a60941b5295389c6fc45639')

options=(staticlibs !strip)
install='unreal-engine-bin.install'

prepare() {
    # Remove chmod commands for SetupDotnet.sh
    chmod 777 "$srcdir"/Engine/Build/BatchFiles/Linux/SetupDotnet.sh
    sed -i '/chmod/d' "$srcdir"/Engine/Build/BatchFiles/Linux/SetupDotnet.sh
    chmod 555 "$srcdir"/Engine/Build/BatchFiles/Linux/SetupDotnet.sh
}

package() {
    # Application files
    mkdir -p "$pkgdir"/opt/unreal-engine
    mv Engine FeaturePacks Samples Templates "$pkgdir"/opt/unreal-engine/

    # Application & MIME icons
    for res in 16 24 32 48 64 256; do
        mkdir -p "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/{apps,mimetypes}
        cp ${res}.png "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/apps/unreal-engine.png
        ln -s ../apps/unreal-engine.png "$pkgdir"/usr/share/icons/hicolor/${res}x${res}/mimetypes/application-x-uproject.png
    done

    # Desktop file
    mkdir -p "$pkgdir"/usr/share/applications
    cp unreal-engine.desktop "$pkgdir"/usr/share/applications/

    # MIME XML file
    mkdir -p "$pkgdir"/usr/share/mime/packages
    cp unreal-engine.xml "$pkgdir"/usr/share/mime/packages/
}
