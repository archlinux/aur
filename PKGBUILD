# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>

pkgname=etqw-demo
pkgver=2
pkgrel=3
pkgdesc="Enemy Territory: Quake Wars demo"
arch=('i686' 'x86_64')
url="http://zerowing.idsoftware.com/linux/etqw/ETQWFrontPage/"
license=('custom')

depends_x86_64=('lib32-alsa-lib' 'lib32-libgl' 'lib32-sdl' 'lib32-gcc-libs' 'lib32-zlib' 'lib32-libjpeg')
optdepends_x86_64=('lib32-nvidia-utils: Accelerated 3D with the NVIDIA binary blob video driver'
'lib32-catalyst-utils: Accelerated 3D with the AMD/ATI binary blob video driver')

depends_i686=('libgl' 'sdl' 'gcc-libs' 'zlib' 'libjpeg')

makedepends=('unzip')
source=('etqw-demo.launcher' 'etqw-demo-ded.launcher' 'etqw-demo.desktop' \
'ftp://ftp.idsoftware.com/idstuff/etqw/ETQW-demo2-client-full.r1.x86.run')
#Mirrors: http://www.filewatcher.com/m/ETQW-demo2-client-full.r1.x86.run.691248874.0.0.html
md5sums=('1b1826f6a4ee23228fec629412c29367'
         '849d3ac67cdcdf8ee7caca721736fb41'
         '477b276b244215451886d2864bbe6406'
         '11f5a882127a917b6c8b648ffa22da74')

build() {
    # Create Destination Directories
    install -d $pkgdir/opt/etqw-demo
    install -d $pkgdir/usr/bin

    # Unzip Linux Client Data
    unzip -qqo $srcdir/ETQW-demo${pkgver}-client-full.r1.x86.run -x scripts/* guis/* -d $pkgdir/opt/ && msg Finished Extracting
}

package() {
    # Move Linux Client Data to Destination Directory
    mv $pkgdir/opt/data/* $pkgdir/opt/etqw-demo/

    # Make Binaries/Scripts Executable
    chmod +x $pkgdir/opt/etqw-demo/{etqw,etqw-dedicated,etqw.x86,*.so,*.so.*,pb/*.so}

    # Fix Bots Directory Permissions
    chmod 755 $pkgdir/opt/etqw-demo/base/bots

    # Install License (ETQW)
    install -D -m 644 $pkgdir/opt/etqw-demo/EULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/EULA.txt

    # Install License (PunkBuster)
    install -D -m 644 $pkgdir/opt/etqw-demo/pb/PBEULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/PBEULA.txt

    # Install Launcher (Client)
    install -D -m 755 $srcdir/etqw-demo.launcher \
        $pkgdir/usr/bin/etqw-demo

    # Install Launcher (Server)
    install -D -m 755 $srcdir/etqw-demo-ded.launcher \
        $pkgdir/usr/bin/etqw-demo-dedicated

    # Install Desktop File
    install -D -m 644 $srcdir/etqw-demo.desktop \
        $pkgdir/usr/share/applications/etqw-demo.desktop

    # Install Icon File
    install -D -m 644 $pkgdir/opt/etqw-demo/etqw_icon.png \
        $pkgdir/usr/share/pixmaps/etqw-demo.png
}
