# Maintainer: Jan Cholasta <jan at cholasta net>

pkgname=nblood
pkgver=1.01
pkgrel=1
pkgdesc='Blood port based on EDuke32'
arch=('i686' 'x86_64')
url='http://nukeykt.retrohost.net/'
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
makedepends=('imagemagick')
makedepends_i686=('nasm')
source=("https://github.com/nukeykt/NBlood/archive/v${pkgver}.tar.gz"
        'nblood.desktop')
sha256sums=('02dcbf123d5962f13ed0e33f6b4ea5627b0089e21e5bee5c5f2983c606ff86ee'
            '58807697e95e071a6354f87e8e2fdae9f32af0e08dad1a510a0089845df42184')

prepare() {
    cd NBlood-${pkgver}
    sed -i 's|/etc/timidity|/etc/timidity++|g' source/blood/src/sdlmusic.cpp
}

build() {
    cd NBlood-${pkgver}
    make PACKAGE_REPOSITORY=1 REVFLAG="-DREV=\\\"v${pkgver}\\\""
    MAGICK_OCL_DEVICE=OFF convert \
        source/blood/rsrc/game.bmp \
        -gravity center \
        -crop 200x200+0+0 \
        -rotate 90 \
        -resize 192x192 \
        nblood.png
}

package() {
    cd NBlood-${pkgver}
    install -D -t "$pkgdir"/usr/bin nblood
    install -D -t "$pkgdir"/usr/share/games/nblood -m 644 nblood.pk3
    install -D -t "$pkgdir"/usr/share/licenses/$pkgname -m 644 package/common/buildlic.txt
    install -D -t "$pkgdir"/usr/share/applications -m 644 "$srcdir"/nblood.desktop
    install -D -t "$pkgdir"/usr/share/icons/hicolor/192x192/apps -m 644 nblood.png
}
