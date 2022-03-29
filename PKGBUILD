# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: scarecrow <gorillaki at gmail dot com>

pkgname=scid_vs_pc
pkgver=4.23
pkgrel=1
pkgdesc="Shane's Chess Information Database"
arch=('i686' 'x86_64')
url="http://scidvspc.sourceforge.net/"
license=('GPL2')
depends=('zlib' 'tk')
optdepends=('snack' 'tdom')
install=$pkgname.install
conflicts=('scid')
source=("scid_vs_pc-"$pkgver".tgz::http://sourceforge.net/projects/scidvspc/files/source/scid_vs_pc-"$pkgver".tgz/download"
        scid
        $pkgname.desktop
        $pkgname.install
        scidlet)
md5sums=('8a073e95f6988fc6af632e656c6d5000'
         '48f02834420046d1ebd2de22f07ba87c'
         '1df155b3ff86a505dc51a29fa7bfc172'
         'c9ba274c986122ca4c1cd202431b64ce'
         'e91cd976d8f183999a24b4d44ae34fe1')

prepare() {
    cd $srcdir/$pkgname-$pkgver

    # Fix for tcl 8.6
    sed -i 's/8.5/8.6/g' ./configure
    ./configure BINDIR=/usr/bin/ SHAREDIR=/usr/share/scid/ TCL_VERSION="8.6" OPTIMIZE="-O2 -funroll-loops"
}

build() {
    cd $srcdir/$pkgname-$pkgver

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver

    # Create directories
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/usr/share/scid/{bases,bin,bitmaps,books,data,html,lang,sounds}
    install -dm755 $pkgdir/usr/share/scid/bin/scripts
    install -dm755 $pkgdir/usr/share/fonts/truetype/Scid

    # Data
    install -m 755 scid sc_* scidpgn pgnscid tkscid tcscid scmerge scidlet* scidt $pkgdir/usr/share/scid/bin
    rm -r scripts/CB-Mega
    install -m 755 scripts/[a-z]* $pkgdir/usr/share/scid/bin/scripts
    install -m 644  scid.eco $pkgdir/usr/share/scid/data
    install -m 644  spelling.ssp $pkgdir/usr/share/scid

    # Start files
    install -m 755 $srcdir/scid $pkgdir/usr/bin
    install -m 755 $srcdir/scidlet $pkgdir/usr/bin

    # Opening books
    install -m 666  books/* $pkgdir/usr/share/scid/books

    # Translation files
    install -m 666  tcl/lang/* $pkgdir/usr/share/scid/lang

    # Sounds
    cp sounds/* $pkgdir/usr/share/scid/sounds

    # Bases
    install -m 666  bases/* $pkgdir/usr/share/scid/bases

    # Bitmaps
    cp bitmaps/* $pkgdir/usr/share/scid/bitmaps

    # Docs
    cp -r html/* $pkgdir/usr/share/scid/html

    # Chess engines
    cd engines/
    cp phalanx/phalanx $pkgdir/usr/bin
    cp toga/src/fruit $pkgdir/usr/bin
    install -Dm666 phalanx/eco.phalanx $pkgdir/usr/share/scid/engines/phalanx/eco.phalanx
    install -m 644  phalanx/pbook.phalanx $pkgdir/usr/share/scid/engines/phalanx

    # Fonts
    cd ..
    cp fonts/{ScidChessStandard,ScidChessTraveller}.ttf $pkgdir/usr/share/fonts/truetype/Scid

    # Desktop icon
    install -Dm644 icons/scid.png $pkgdir/usr/share/pixmaps/scid.png
    install -Dm644 $srcdir/scid_vs_pc.desktop $pkgdir/usr/share/applications/scid_vs_pc.desktop
}
