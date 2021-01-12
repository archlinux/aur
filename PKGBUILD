# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=punes-git
pkgver=0.107.r1233.b8dc4659
pkgrel=1
pkgdesc="Nintendo Entertaiment System emulator"
arch=('x86_64')
url="http://forums.nesdev.com/viewtopic.php?t=6928"
license=('GPL2')
depends=('alsa-lib' 'desktop-file-utils' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'qt5-base' 'qt5-svg')
makedepends=('automake' 'cmake' 'git' 'qt5-tools')
conflicts=('punes')
provides=('punes')
source=("git+https://github.com/punesemu/puNES.git")
md5sums=('SKIP')

#breaks internal lib7zip
options=('!buildflags')

pkgver() {
    cd puNES
    printf "%s.r%s.%s" "$(git describe --abbrev=0 --tags | sed 's/v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"/puNES
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    #As of 11 January 2021 "make install" appears to be broken
    #cd "${srcdir}"/puNES
    #make DESTDIR="${pkgdir}" install
    #rm -f "${pkgdir}"/usr/share/applications/mimeinfo.cache

    #Install manually.
    cd "${srcdir}"/puNES/misc
    for i in 16 32 48 256; do
            icon=hicolor_apps_${i}x${i}_punes.png
            theme=`echo $icon | cut -d_ -f1`
            context=`echo $icon | cut -d_ -f2`
            size=`echo $icon | cut -d_ -f3`
            iconfile=`echo $icon | cut -d_ -f4`
            install -Dm 644 ./$icon "${pkgdir}"/usr/share/icons/$theme/$size/$context/$iconfile
        done
    install -Dm 644 ./punes.desktop "${pkgdir}"/usr/share/applications/punes.desktop
    cd "${srcdir}"/puNES/src
    install -Dm 755 ./punes "${pkgdir}"/usr/bin/punes
}
