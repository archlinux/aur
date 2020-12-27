# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname='camomile-git'
pkgdesc='Camomile is a plugin with Pure Data embedded that offers to load and to control patches inside a digital audio workstation'
pkgver=1.0.7
pkgrel=1
depends=('freetype2')
makedepends=('git' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'alsa-lib')
optdepends=()
conflicts=('camomile')
replaces=('camomile')
arch=('x86_64')
url='https://github.com/pierreguillot/Camomile'
license=('GPL3')
source=("git+https://github.com/pierreguillot/Camomile/")
sha512sums=('SKIP')

prepare() {
    cd "${srcdir}/Camomile"
    git submodule update --init --recursive
}

build () {
    cd "${srcdir}/Camomile"
    cd Dependencies/LibPdBuild/LinuxMakefile
    cmake -DCMAKE_BUILD_TYPE=Release ..
    
    cd "${srcdir}/Camomile"
    make TARGET_ARCH=-m64 CONFIG=Release
}

package () {
    cd "${srcdir}/Camomile"
    mkdir -p "${pkgdir}/usr/lib/lv2/"
    mkdir -p "${pkgdir}/usr/lib/vst3"
    
    mkdir -p "${pkgdir}/usr/lib/lv2/Camomile.lv2"
    cp -a Plugins/CamomileLV2.so "${pkgdir}/usr/lib/lv2/Camomile.lv2"
    cp -ar Plugins/Camomile.vst3 "${pkgdir}/usr/lib/vst3/"
    cp -ar Plugins/CamomileFx.vst3 "${pkgdir}/usr/lib/vst3/"
    
    # find Plugins/Builds -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    # find Plugins/Builds -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
}
