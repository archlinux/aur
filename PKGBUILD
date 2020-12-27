# Maintainer: Artem Klevtsov a.a.klevtsov@gmail.com

pkgname='camomile-git'
pkgdesc='Camomile is a plugin with Pure Data embedded that offers to load and to control patches inside a digital audio workstation'
pkgver=1.0.7
pkgrel=1
groups=('vst-plugins' 'lv2-plugins' 'vst3-plugins' 'pro-audio')
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
    cd "${srcdir}/Camomile/Dependencies/LibPdBuild/LinuxMakefile"
    cmake -DCMAKE_BUILD_TYPE=Release ..
    
    cd "${srcdir}/Camomile"
    make TARGET_ARCH=-m64 CONFIG=Release
    
    cd "${srcdir}/Camomile/Plugins"
    ./camomile
}

package () {
    cd "${srcdir}/Camomile/Plugins/builds"
    mkdir -p "${pkgdir}/usr/lib/lv2/"
    find . -name '*.lv2' -type d -exec cp -ar {} "${pkgdir}/usr/lib/lv2/" \;
    mkdir -p "${pkgdir}/usr/lib/vst3"
    find . -name '*.vst3' -type d -exec cp -ar {} "${pkgdir}/usr/lib/vst3/" \;
}
