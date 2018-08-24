# Maintainer: Ysblokje <ysblokje at gmail dot com>
# git version for the opensourced starruler2 
pkgname=starruler2-git
pkgver=r27.ba99a9a
pkgrel=1
pkgdesc="4X Space Strategy game Star Ruler 2's open source distribution."
arch=('x86_64')
url="http://starruler2.com/"
license=('MIT')
depends=('libpng' 'zlib' 'glew' 'glu' 'freetype2' 'libvorbis' 'libogg' 'openal' 'bzip2' 'libxrandr' 'curl')
makedepends=('git' 'cmake' 'imagemagick' 'gcc' 'make')
provides=('starruler2')
source=("git+https://github.com/BlindMindStudios/StarRuler2-Source.git"
    "starruler2.desktop")
sha256sums=('SKIP'
    'c2df769b599b5f9ba5804052f8a32c2625fd99be9201660830f2be405f374e0b')

pkgver() {
    cd StarRuler2-Source
#    echo $(git rev-parse --short HEAD)
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd StarRuler2-Source
    LDFLAGS=-std=c++11 make -k -f source/linux/Makefile compile -j`nproc`
    convert sr2.ico sr2.png
}

prepare() {
   echo "prepare"
}

package() {
    echo "package"
    dest=${pkgdir}/opt/starruler2/
    mkdir -p ${pkgdir}/usr/share/{pixmaps,applications}
    cp -dpr --no-preserve=ownership starruler2.desktop ${pkgdir}/usr/share/applications/
    cd ${srcdir}/StarRuler2-Source
    cp -dpr --no-preserve=ownership sr2.png ${pkgdir}/usr/share/pixmaps/
    mkdir -p ${dest}
    chmod +x StarRuler2.sh
    cp -dpr --no-preserve=ownership StarRuler2.sh ${dest}
    cp -dpr --no-preserve=ownership bin maps mods locales data scripts ${dest}
}
