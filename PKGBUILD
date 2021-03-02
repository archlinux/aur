# Maintainer: Peter Tseng <pht24 weird-squiggly-symbol cornell dot edu>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname=lockjaw
pkgver=046
pkgrel=7
pkgdesc="Free and highly customizable implementation of Tetris"
arch=('i686' 'x86_64')
url="https://www.pineight.com/lj"
license=('GPL')
depends=('allegro4')

# WARNING!!! This is not the original URL of the Lockjaw source code!
# The original website has removed its copy of the Lockjaw, so I was forced to use alternative means.
# I can make no personal guarantees as to the integrity of the file.
# I did however verify that the sha256sum matches the copy I have before it was taken down.
# That sha256sum is the one listed in this PKGBUILD.
# I also did verify that diff -ru on the extracted contents showed no changes.
# Unfortunately I realize that these claims aren't really verifiable by an outside party,
# at least without access to the original sources.
# Alas, this is the best I am able to offer you for the time being...
source=("https://sites.google.com/site/xaelous/40l/lj${pkgver}-src.zip" \
lj.dat \
sound.dat \
ljbg.jpg \
ljblocks-sega.bmp \
ljblocks.bmp \
ljconn-sega.bmp \
ljconn.bmp \
bgm.s3m \
bgm-rhythm.s3m \
lockjaw.desktop \
lockjaw.sh \
lockjaw.xpm \
)

sha256sums=('376519ad8ee97bfc19d79218b57abfb7fab96789c29999fa387ff7801619d4d9'
            '8924e28dbaa56e0a29dae93a23a0ef91e418c93a6c1d791c59a79274be787f36'
            '4d8acec9cf9f167637d5487272649a0097787c3c5e1afe6e2886903b0260988e'
            '26adf0eb8013aa4649049ec6160cff243ac9fcebc315ada2d25dac6327103018'
            '84ffb7c54ac80f004473a1ced5a898944df468cff07d909ad0bf7f20d824ad19'
            '57dec1eff3977b6c1365ba89d0a6e3a287704d9099470f11b1eaa109f13fa8b3'
            '5591cf53754b9b87302f6b7a45f6816feb7fc8266754483e65b7a7dbdb309b0d'
            '995384c53a310da5dbf1119c84d58fcb246ebf16097b13a5fd6c2db7c57b45e8'
            'f8c75d414530c169cedf766987c30dab42665967c0b1909422e32dfceab04045'
            '855ffd1bad6c421c2df41ddf1be86bea9155ea6639ebd35695c9eecc3b42ddb1'
            '33fb49f9fbd1cbd2fda900194a12f7e4ca6adce34236a5e8aba84654d290e869'
            'a41fdf4443a752e89534e239368da1c57ea50ebb677c1fd59d3c6829cb7b7ff4'
            'c2617585eb1d6f92c8ddf834b6a896fabb8eee85173f1ac8bea6c966ccee83ca')

build() {
    cd "${srcdir}"
    # Allegro gives us jpgalleg now... but the name in the makefile is wrong!
    sed -i "s/jpgal/jpgalleg/" makefile
    # It appears aldumb.h doesn't exist anymore, so we'll just not use it.
    sed -i "s/-laldmb//" makefile
    sed -i "s/-ldumb//" makefile
    sed -i "s/LJMUSIC_USING_DUMB 1/LJMUSIC_USING_DUMB 0/" src/ljmusic.h
    # -mwindows most definitely not supported by gcc and not what we want.
    sed -i "s/-mwindows//" makefile
    # In addition, I need an -lm otherwise cos is undefined
    sed -i "s/LINUXLDLIBS :=/LINUXLDLIBS := -lm/" makefile
    make linux
}

package() {
    cd "${srcdir}"
    # Unfortunately, makefile doesn't have make install, so...
    mkdir -m 755 -p "${pkgdir}/opt/lockjaw"

    # Copy all this stuff over.
    install -D -m644 *.dat *.bmp *.jpg bgm* README.html "${pkgdir}/opt/lockjaw"
    install -D -m755 lj "${pkgdir}/opt/lockjaw"
    mkdir "${pkgdir}/opt/lockjaw/docs"
    install -m644 docs/* "${pkgdir}/opt/lockjaw/docs"
    touch "${pkgdir}/opt/lockjaw/installed.ini"

    # Install desktop, launcher sh script.
    install -D -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
}
