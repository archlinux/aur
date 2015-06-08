# Maintainer: Gerardo Marset <gammer1994@gmail.com>

pkgname=amnesia-tdd
pkgver=1.2.1r3
pkgrel=1
pkgdesc="A game about immersion, discovery and living through a nightmare."
arch=('i686' 'x86_64')
url="http://www.amnesiagame.com/"
license=('custom')
makedepends=('xz')
depends=('libxft')
_sh=amnesia_tdd-${pkgver/r/-}.sh
source=($_sh)
if [ "$pkgver" == "1.2.1r3" ] ; then
    md5sums=('b3b04553dbf56570e7270d52a04d5ddd')
elif [ "$pkgver" == "1.2" ] ; then
    md5sums=('5151ae5b89f6c8a8ddc10dfb19d8feb3')
fi

_installdir="/usr/share/games/$pkgname"
[ "$CARCH" == "x86_64" ] && _suffix=_64

PKGEXT=.pkg.tar

build() {
    msg "Extracting installer..."
    sh $_sh --tar -xvf

    msg "Extracting subarchive..."
    tar --lzma -xvf subarch

    msg "Extracting common files..."
    mkdir -p $pkgdir/$_installdir
    cd $pkgdir/$_installdir
    lzcat $srcdir/instarchive_all | tar -xvf -

    msg "Extracting arch-specific files..."
    tar --lzma -xvf $srcdir/instarchive_all_x86$_suffix

    msg "Moving stuff around..."
    mv Amnesia/* .
    rmdir Amnesia
    mv libs${_suffix/_/}/all/* libs${_suffix/_/}
    rmdir libs${_suffix/_/}/all

    msg "Copying license..."
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    cp $srcdir/config/license $pkgdir/usr/share/licenses/$pkgname/LICENSE

    msg "Creating launchers..."
    mkdir -p $pkgdir/usr/bin
    ln -s $_installdir/Amnesia.bin${_suffix/_/} $pkgdir/usr/bin/$pkgname
    ln -s $_installdir/Launcher.bin${_suffix/_/} $pkgdir/usr/bin/$pkgname-launcher
    f=$pkgdir/usr/bin/$pkgname-justine
    echo "#!/bin/bash" > $f
    echo "" >> $f
    echo "$pkgname $_installdir/config/ptest_main_init.cfg \$@" >> $f
    chmod +x $f

    mkdir -p $pkgdir/usr/share/{pixmaps,applications}
    cp Amnesia.png $pkgdir/usr/share/pixmaps/$pkgname.png
    f=$pkgdir/usr/share/applications/$pkgname.desktop 
    echo "[Desktop Entry]" > $f
    echo "Name=Amnesia: The Dark Descent" >> $f
    echo "Comment=$pkgdesc" >> $f
    echo "Exec=$pkgname-launcher" >> $f
    echo "Icon=$pkgname.png" >> $f
    echo "Type=Application" >> $f
    echo "Categories=Game;" >> $f
    echo "Encoding=UTF-8" >> $f
}
