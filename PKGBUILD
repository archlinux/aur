# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ioquake3
pkgver=1.36
pkgrel=2
pkgdesc="The de-facto OSS Quake 3 distribution. You need the retail/demo .pk3 files to play."
url="http://ioquake3.org/"
license='GPL'
arch=('i686' 'x86_64')
depends=('sdl' 'openal')
makedepends=('nasm')
conflicts=('quake3' 'quake3-icculus-svn' 'quake3-svn' 'ioquake3-svn')
provides=('quake3')
replaces=('quake3')
install=quake3.install
source=('quake3.desktop' 'quake3.launcher' 'quake3ded.launcher' \
"http://www.ioquake3.org/files/${pkgver}/${pkgname}-${pkgver}.tar.bz2" \
'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run' \
'botlib.patch::http://bugzilla-attachments.icculus.org/attachment.cgi?id=2196')
md5sums=('9eca51e2b3ee3e0100944cba436a2a4c'
         'ea5d99df80b41269523b34229fdf854d'
         'ea5d99df80b41269523b34229fdf854d'
         'f938379a4a519ae32f6ffaacaf866cde'
         'c71fdddccb20e8fc393d846e9c61d685'
         '4485f84a4a9bc9a25f2737ee1744febd')

build() {
    cd $srcdir/$pkgname-$pkgver/

    # Modify Makefile to correct install path
    /bin/sed -i "s:/usr/local/games/quake3:$pkgdir/opt/quake3:" Makefile

    # Patch botlib so bots work on 64bit
    patch -p1 < $srcdir/botlib.patch || return 1

    # Compile ioQuake3
    make || return 1

    # Install Files
    make copyfiles || return 1

    # Extract Patch Files
    cd $srcdir
    chmod +x $srcdir/linuxq3apoint-1.32b-3.x86.run
    $srcdir/linuxq3apoint-1.32b-3.x86.run --tar xf

    # Modify Launcher Scripts
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems
        #
        /bin/sed -i "s:IOQ3_BINARY:ioquake3.x86_64:" \
            $srcdir/quake3.launcher
        /bin/sed -i "s:IOQ3_BINARY:ioq3ded.x86_64:" \
            $srcdir/quake3ded.launcher
    else
        #
        # i686 Systems
        #
        /bin/sed -i "s:IOQ3_BINARY:ioquake3.i386:" \
            $srcdir/quake3.launcher
        /bin/sed -i "s:IOQ3_BINARY:ioq3ded.i386:" \
            $srcdir/quake3ded.launcher
    fi

    # Install Quake 3 Patch Files
    install -m 644 $srcdir/baseq3/*.pk3 \
        $pkgdir/opt/quake3/baseq3/

    # Install Quake 3 Expansion Pack Patch Files
    install -m 644 $srcdir/missionpack/*.pk3 \
        $pkgdir/opt/quake3/missionpack/

    # Install Launcher (Client)
    install -D -m 755 $srcdir/quake3.launcher \
        $pkgdir/usr/bin/quake3

    # Install Launcher (Server)
    install -D -m 755 $srcdir/quake3ded.launcher \
        $pkgdir/usr/bin/quake3ded

    # Install Desktop File
    install -D -m 644 $srcdir/quake3.desktop \
        $pkgdir/usr/share/applications/quake3.desktop

    # Install Icon File
    install -D -m 644 $srcdir/$pkgname-$pkgver/misc/quake3.png \
        $pkgdir/usr/share/pixmaps/quake3.png
}
