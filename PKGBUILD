# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

# This is a split package since most people only need the VST3 plugin
pkgbase=chowtapemodel-git
pkgname=('chowtapemodel-jack-git' 'chowtapemodel-vst3-git' 'chowtapemodel-lv2-git')
_pkgname=AnalogTapeModel
pkgver=2.9.0.r20.gd5b3109
pkgrel=2
pkgdesc="Physical modelling signal processing for analog tape recording"
arch=('x86_64')
url="https://github.com/jatinchowdhury18/AnalogTapeModel"
license=('GPL3')
depends=('freeglut' 'freetype2' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('git' 'cmake' 'alsa-lib' 'jack' 'webkit2gtk')
source=('git+https://github.com/jatinchowdhury18/AnalogTapeModel.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule update --init --recursive -j 4
}

build() {
    cd "$srcdir/$_pkgname/Plugin"
    cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
    make -C build CHOWTapeModel_Standalone CHOWTapeModel_VST3 CHOWTapeModel_LV2
}

package_chowtapemodel-jack-git() {
    depends+=('alsa-lib' 'jack')
    provides=('chowtapemodel-jack')

    cd "$srcdir/$_pkgname/Plugin/build/CHOWTapeModel_artefacts/Release"
    install -dm755 "$pkgdir/usr/bin"
    cp -r Standalone/CHOWTapeModel "$pkgdir/usr/bin"
}

package_chowtapemodel-vst3-git() {
    provides=('chowtapemodel-vst3' 'chowtapemodel.vst3' 'chowtapemodel.vst3-git')

    cd "$srcdir/$_pkgname/Plugin/build/CHOWTapeModel_artefacts/Release"
    install -dm755 "$pkgdir/usr/lib/vst3"
    cp -r VST3/CHOWTapeModel.vst3 "$pkgdir/usr/lib/vst3"
}

package_chowtapemodel-lv2-git() {
    provides=('chowtapemodel-lv2' 'chowtapemodel.lv2' 'chowtapemodel.lv2-git')

    cd "$srcdir/$_pkgname/Plugin/build/CHOWTapeModel_artefacts/Release"
    install -dm755 "$pkgdir/usr/lib/lv2"
    cp -r LV2/CHOWTapeModel.lv2 "$pkgdir/usr/lib/lv2"
}
