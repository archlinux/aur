# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=etqw
pkgver=1.5
pkgrel=2
pkgdesc="Enemy Territory: Quake Wars is a commercial team and class-based multiplayer game. You need the retail DVD to play."
arch=('i686' 'x86_64')
url="http://zerowing.idsoftware.com/linux/etqw/"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-alsa-lib' 'lib32-libgl' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-zlib' 'lib32-libjpeg')
else
    depends=('libgl' 'sdl' 'gcc-libs' 'zlib' 'libjpeg')
fi
makedepends=('unzip')
conflicts=('bin32-etqw')
install='etqw.install'
source=('etqw.launcher' 'etqw-rthread.launcher' 'etqwded.launcher' 'etqw.desktop' \
"http://www.altfire.com/main/files/Gaming/Games/Quake%20Wars/ETQW-client-1.5-linux.x86.run")
md5sums=('3cbe2e753a7ab8406180ae2a8b7a1aa8'
         'c7df646e396bd08727c713aab8b398ed'
         'a3769be79f6ff5071d89f908078397dd'
         '1ccd43afd8b418333b49495648dc7f2a'
         '28fd825fcd9f6227827230b319e481cf')

build() {
    # Create Destination Directories
    install -d $pkgdir/opt/

    # Unzip Linux Client Data
    sh -c "unzip -o $srcdir/ETQW-client-${pkgver}-full.x86.run -d $srcdir/ data/*; true"

    # Move Linux Client Data to Destination Directory
    mv $srcdir/data $pkgdir/opt/etqw

    # Make Binaries/Scripts Executable
    chmod +x $pkgdir/opt/etqw/{etqw,etqw-dedicated,etqw.x86,*.so,*.so.*,pb/*.so}

    # Fix Bots Directory Permissions
    chmod 755 $pkgdir/opt/etqw/base/bots

    # Install License (ETQW)
    install -D -m 644 $pkgdir/opt/etqw/EULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/EULA.txt

    # Install License (PunkBuster)
    install -D -m 644 $pkgdir/opt/etqw/pb/PBEULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/PBEULA.txt

    # Install Launcher (Client)
    install -D -m 755 $srcdir/etqw.launcher \
        $pkgdir/usr/bin/etqw

    # Install Launcher (Client)
    install -D -m 755 $srcdir/etqw-rthread.launcher \
        $pkgdir/usr/bin/etqw-rthread

    # Install Launcher (Server)
    install -D -m 755 $srcdir/etqwded.launcher \
        $pkgdir/usr/bin/etqw-dedicated

    # Install Desktop File
    install -D -m 644 $srcdir/etqw.desktop \
        $pkgdir/usr/share/applications/etqw.desktop

    # Install Icon File
    install -D -m 644 $pkgdir/opt/etqw/etqw_icon.png \
        $pkgdir/usr/share/pixmaps/etqw.png

    # Create Directories for Retail Files
    install -d $pkgdir/opt/etqw/base/{megatextures,video}
}

