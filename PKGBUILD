# Maintainer: Paul Davis ("dangersalad") <paul@dangersalad.com>
# Original Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=dfhack-twbt-bin
_pkgname=dfhack
pkgver=0.44.07
_pkgver=$pkgver-alpha1
_twbtver=6.39
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
    https://github.com/DFHack/dfhack/releases/download/$_pkgver/dfhack-$_pkgver-Linux-64-gcc-4.8.tar.bz2
    https://github.com/mifki/df-twbt/releases/download/v$_twbtver/twbt-$_twbtver-linux.zip
)

md5sums=('af6d938767d1f09608df67dc4c0fd1a1'
         '3853c6f890d3541f710f2c4833a9e696'
         '687e97c2884ff9f0a8a29729cda8d098'
         '0e58fb17a978595422803f723caefddb')

prepare() {
    sed -e 's|setarch i386 -R ||' \
        -i $srcdir/dfhack
}

package() {
    install -d $pkgdir/opt/dwarffortress

    cp -r $srcdir/{hack,dfhack,dfhack-run,dfhack-config,dfhack.init-example,stonesense} $pkgdir/opt/dwarffortress

    install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
    install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run
    
    install -Dm755 $srcdir/$_pkgver/mousequery.plug.so $pkgdir/opt/dwarffortress/hack/plugins
    install -Dm755 $srcdir/$_pkgver/twbt.plug.so $pkgdir/opt/dwarffortress/hack/plugins
    
    install -Dm755 $srcdir/shadows.png $pkgdir/opt/dwarffortress/data/art/shadows.png
    install -Dm755 $srcdir/white1px.png $pkgdir/opt/dwarffortress/data/art/white1px.png
    install -Dm755 $srcdir/transparent1px.png $pkgdir/opt/dwarffortress/data/art/transparent1px.png
    install -Dm755 $srcdir/overrides.txt $pkgdir/opt/dwarffortress/data/init/overrides.txt

    install -Dm644 $srcdir/hack/LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

