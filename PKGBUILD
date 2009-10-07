# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=2.0
pkgrel=1
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play."
url="http://ezquake.sourceforge.net/"
license=('GPL')
depends=('libgl' 'libxxf86dga')
makedepends=('unzip' 'wget')
conflicts=('fuhquake')
provides=('fuhquake')
arch=('i686' 'x86_64')
install=ezquake.install
source=('ezquake.launcher' 'ezquake.install' 'ezquake.desktop' \
"http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux-x86_$pkgver.tar.gz" \
"http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_source_$pkgver.zip")
noextract=("ezquake_linux-x86_$pkgver.tar.gz")
md5sums=('a61707a154bc97723f9a4fad65327df3'
         'b56e6329253ffdccdab303f80771c347'
         '75cfa823bf495fe4cdb755c6b5546f2a'
         '25cad2fa8f695b18b2e6cab313a7a8be'
         '966922142bb577d7dd1a0512e3a1ff7a')

build() {
    cd $startdir/src

    # Make Directories
    install -d $pkgdir/opt/quake

    # Unpack ezQuake
    bsdtar -x -o -C $pkgdir/opt/quake -f $srcdir/ezquake_linux-x86_$pkgver.tar.gz

    # Remove Binaries
    rm $pkgdir/opt/quake/ezquake{-gl.glx,.svga,.x11}

    # Download Extra Libraries needed to compile
    if [ "$CARCH" = "i686" ]; then
        cd $srcdir/src/libs/linux-x86/
        ./download.sh
    else
        cd $srcdir/src/libs/linux-x86_64/
        ./download.sh
    fi

    # Change to Source Code Directory
    cd $srcdir/src/

    # Compile Source Code
    make glx || return 1

    # Install Binaries
    if [ "$CARCH" = "i686" ]; then
        install -D -m755 -t $pkgdir/opt/quake/ \
            $srcdir/src/release-x86/ezquake-gl.glx
    else
        install -D -m755 -t $pkgdir/opt/quake/ \
            $srcdir/src/release-x86_64/ezquake-gl.glx
    fi

    # Make id1 Directory for pak0.pak and pak1.pak files
    install -d $pkgdir/opt/quake/id1/

    # Install Icon
    install -D -m644 $srcdir/src/ezquake.ico \
        $pkgdir/usr/share/pixmaps/ezquake.ico

    # Install Launcher
    install -D -m755 $srcdir/ezquake.launcher \
        $pkgdir/usr/bin/ezquake

    # Install Desktop
    install -D -m644 $srcdir/ezquake.desktop \
        $pkgdir/usr/share/applications/ezquake.desktop
} 
