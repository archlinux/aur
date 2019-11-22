# Maintainer: Jan Cholasta <jan at cholasta net>

pkgname=pcexhumed-git
pkgver=211119+6+g945391c
pkgrel=1
pkgdesc='Exhumed / PowerSlave port based on EDuke32 (git version)'
arch=('i686' 'x86_64')
url='https://gitlab.com/exhumed/exhumed'
license=('GPL' 'custom:BUILD')
depends=('flac'
         'glu'
         'gtk2'
         'libgl'
         'libogg'
         'libvorbis'
         'sdl2'
         'sdl2_mixer'
         'timidity++')
makedepends=('git' 'imagemagick')
makedepends_i686=('nasm')
provides=('pcexhumed')
conflicts=('pcexhumed')
source=('exhumed::git+https://gitlab.com/exhumed/exhumed.git'
        'pcexhumed.desktop')
sha256sums=('SKIP'
            'deda95400d3e7b44078cac690fe6203280d0744ee14f523dd715eaf9f567f341')

pkgver() {
    cd exhumed
    git describe --tags --long | sed 's/^v//;s/-/+/g'
}

build() {
    cd exhumed
    make PACKAGE_REPOSITORY=1 REVFLAG="-DREV=\\\"$(git describe --tags --long)\\\""
    MAGICK_OCL_DEVICE=OFF convert \
        source/exhumed/rsrc/game_icon.ico\[10\] \
        pcexhumed.png
}

package() {
    cd exhumed
    install -D -t "$pkgdir"/usr/bin pcexhumed
    install -D -t "$pkgdir"/usr/share/licenses/$pkgname -m 644 package/common/buildlic.txt
    install -D -t "$pkgdir"/usr/share/applications -m 644 "$srcdir"/pcexhumed.desktop
    install -D -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps -m 644 pcexhumed.png
}
