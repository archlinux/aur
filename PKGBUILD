# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=etqw
pkgver=1.5
pkgrel=1
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
source=('etqw.launcher' 'etqwded.launcher' 'etqw.desktop' \
"ftp://ftp.i3d.net/Games/Enemy%20Territory%20Quake%20Wars/Patches/ETQW-client-1.5-full.x86.run")
md5sums=('3cbe2e753a7ab8406180ae2a8b7a1aa8'
         'a3769be79f6ff5071d89f908078397dd'
         '1ccd43afd8b418333b49495648dc7f2a'
         '28fd825fcd9f6227827230b319e481cf')

build() {
    # Create Destination Directories
    install -d $startdir/pkg/opt/

    # Unzip Linux Client Data
    unzip -qqo $startdir/src/ETQW-client-${pkgver}-full.x86.run -d $startdir/src/ data/*

    # Move Linux Client Data to Destination Directory
    mv $startdir/src/data $startdir/pkg/opt/etqw

    # Make Binaries/Scripts Executable
    chmod +x $startdir/pkg/opt/etqw/{etqw,etqw-dedicated,etqw.x86,*.so,*.so.*,pb/*.so}

    # Fix Bots Directory Permissions
    chmod 755 $startdir/pkg/opt/etqw/base/bots

    # Install License (ETQW)
    install -D -m 644 $startdir/pkg/opt/etqw/EULA.txt \
        $startdir/pkg/usr/share/licenses/$pkgname/EULA.txt

    # Install License (PunkBuster)
    install -D -m 644 $startdir/pkg/opt/etqw/pb/PBEULA.txt \
        $startdir/pkg/usr/share/licenses/$pkgname/PBEULA.txt

    # Install Launcher (Client)
    install -D -m 755 $startdir/src/etqw.launcher \
        $startdir/pkg/usr/bin/etqw

    # Install Launcher (Server)
    install -D -m 755 $startdir/src/etqwded.launcher \
        $startdir/pkg/usr/bin/etqw-dedicated

    # Install Desktop File
    install -D -m 644 $startdir/src/etqw.desktop \
        $startdir/pkg/usr/share/applications/etqw.desktop

    # Install Icon File
    install -D -m 644 $startdir/pkg/opt/etqw/etqw_icon.png \
        $startdir/pkg/usr/share/pixmaps/etqw.png

    # Create Directories for Retail Files
    install -d $startdir/pkg/opt/etqw/base/{megatextures,video}
}

