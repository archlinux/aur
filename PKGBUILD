# Maintainer: Yidaozhan Ya <yidaozhan_ya@outlook.com>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

pkgname=obs-plugin-input-overlay
pkgver=4.8
pkgrel=2
#groups=('obs-plugins')
pkgdesc="obs-studio plugin to show keyboard, gamepad and mouse input on stream, legacy v4 branch with D-pad fix for Linux."
arch=("x86_64")
url="https://github.com/univrsal/input-overlay"
license=("GPL")
provides=("obs-input-overlay")
conflicts=("obs-input-overlay")
depends=("obs-studio" "libuiohook")
makedepends=("git")
source=("git+https://github.com/univrsal/input-overlay.git#branch=legacy")
sha256sums=('SKIP')
build() {
    cd "${srcdir}/input-overlay"
    git submodule update --init --recursive
    sed 's#LibObs#libobs#' CMakeLists.txt -i
    cmake .
    make
}
package() {
    cd "${srcdir}/input-overlay"
    mkdir -p "${pkgdir}/usr/lib/obs-plugins/"
    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/locale/"
    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/"
    cp ./input-overlay.so "${pkgdir}/usr/lib/obs-plugins/"
    chmod 755 "${pkgdir}/usr/lib/obs-plugins/input-overlay.so"
    cp -R data/locale/* "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/locale/"
    cp -R presets/* "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/"
    cd "${pkgdir}/usr/share/obs/obs-plugins/input-overlay/presets/"
    for f in *.zip; do unzip -d "${f%*.zip}" "$f"; done
    rm -f *.zip
} 
