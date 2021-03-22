# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>
# Original Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=dfhack-twbt-bin
_pkgname=dfhack
pkgver=0.47.05
_pkgver=$pkgver-r1
_twbtver=6.xx
pkgrel=1
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it including Text Will Be Text plugin"
arch=('x86_64')
url="https://dfhack.readthedocs.org/"
license=('custom')
depends=(dwarffortress=$pkgver lua protobuf libpng12 libxrandr libjpeg6 freetype2 libglvnd libxcursor libxinerama)

conflicts=(dfhack dfhack-git dfhack-bin)
provides=(dfhack)

source=(
    dfhack.sh
    dfhack-run.sh
    dfhack.init
    init.txt
    https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-64bit-gcc-7.tar.bz2
    https://github.com/thurin/df-twbt/releases/download/$_pkgver/twbt-$_twbtver-linux64-$_pkgver.zip
)

md5sums=('e630ae2fc93c6c7b55552336da2b6c07'
         '3853c6f890d3541f710f2c4833a9e696'
         '6730da5fec400ece9102552e77996fcb'
         '052a58e7f5f1af8be3ddefe9677b8fc6'
         '8dabfca61ff02821ed0be0a885ad17f2'
         '672d40f24ca3e94ead4a79ccdc146114')

prepare() {
    sed -e 's|setarch i386 -R ||' \
        -i $srcdir/dfhack
}

package() {
    install -d $pkgdir/opt/dwarffortress

    cp -r $srcdir/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example,stonesense,dfhack.init} $pkgdir/opt/dwarffortress

    install -Dm755 $srcdir/init.txt      $pkgdir/opt/dwarffortress/data/init/init-twbt.txt
    install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
    install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run
    
    install -Dm755 $srcdir/$_pkgver/twbt.plug.so $pkgdir/opt/dwarffortress/hack/plugins
    
    install -Dm755 $srcdir/shadows.png $pkgdir/opt/dwarffortress/data/art/shadows.png
    install -Dm755 $srcdir/white1px.png $pkgdir/opt/dwarffortress/data/art/white1px.png
    install -Dm755 $srcdir/transparent1px.png $pkgdir/opt/dwarffortress/data/art/transparent1px.png
    install -Dm755 $srcdir/overrides.txt $pkgdir/opt/dwarffortress/data/init/overrides.txt

    install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

