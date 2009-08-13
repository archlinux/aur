# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=1.9.3
pkgrel=1
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play."
url="http://ezquake.sourceforge.net/"
license=('GPL')
depends=('libgl')
makedepends=('unzip' 'p7zip')
conflicts=('fuhquake')
provides=('fuhquake')
arch=('i686' 'x86_64')
install=ezquake.install
source=('ezquake.launcher' 'ezquake.install' 'ezquake.desktop' \
"http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux-x86_$pkgver.tar.gz" \
"http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_source_$pkgver.7z")
md5sums=('a61707a154bc97723f9a4fad65327df3'
         '596ab08b5514671eb1dbf72a5deeea3e'
         '75cfa823bf495fe4cdb755c6b5546f2a'
         'baca12d351cb907748e9effb2669190e'
         'd13de873591268c0baba19329eff15d2')

build() {
    cd $startdir/src

    # Make Directories
    install -d $pkgdir/opt

    # Unpack ezQuake
    bsdtar -x -o -C $pkgdir/opt -f $srcdir/ezquake_linux-x86_$pkgver.tar.gz

    # Rename Directory
    mv $pkgdir/opt/ezquake_linux-x86.1.9.3 $pkgdir/opt/quake

    # Unpack ezQuake Source
    7z x $srcdir/ezquake_source_$pkgver.7z

    # Remove Binaries
    rm $pkgdir/opt/quake/ezquake{-gl.glx,.svga,.x11}

    # Change to Source Code Directory
    cd $srcdir/ezquake_19-3_stable/

    # Compile Source Code
    make glx || return 1

    # Install Binaries
    if [ "$CARCH" = "i686" ]; then
        install -D -m755 -t $pkgdir/opt/quake/ \
            $srcdir/ezquake_19-3_stable/release-x86/ezquake-gl.glx
    else
        install -D -m755 -t $pkgdir/opt/quake/ \
            $srcdir/ezquake_19-3_stable/release-x86_64/ezquake-gl.glx
    fi

    # Make id1 Directory for pak0.pak and pak1.pak files
    install -d $pkgdir/opt/quake/id1/

    # Install Icon
    install -D -m644 $srcdir/ezquake_19-3_stable/ezquake.ico \
        $pkgdir/usr/share/pixmaps/ezquake.ico

    # Install Launcher
    install -D -m755 $srcdir/ezquake.launcher \
        $pkgdir/usr/bin/ezquake

    # Install Desktop
    install -D -m644 $srcdir/ezquake.desktop \
        $pkgdir/usr/share/applications/ezquake.desktop
} 
