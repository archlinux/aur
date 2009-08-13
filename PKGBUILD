# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: Premysl Janouch <warriant@gmail.com>

pkgname=quake2
pkgver=r0.16.1
pkgrel=8
pkgdesc="Quake 2 engine. You need the retail .pak files to play."
url="http://www.icculus.org/quake2/"
license=('GPL')
depends=('libjpeg' 'sdl' 'libxxf86vm' 'libxxf86dga')
makedepends=('patch' 'unzip')
conflicts=()
replaces=()
backup=()
install="quake2.install"
arch=('i686' 'x86_64')
source=("http://www.icculus.org/quake2/files/quake2-$pkgver.tar.gz" \
'http://www.icculus.org/quake2/files/maxpak.pak' \
'http://cesium.di.uminho.pt/pub/games/quake2/source/xatrixsrc320.shar.Z' \
'http://cesium.di.uminho.pt/pub/games/quake2/source/roguesrc320.shar.Z' \
'ftp://ftp.idsoftware.com/idstuff/quake2/q2-3.20-x86-full-ctf.exe' \
'quake2.sh' 'q2ded.sh' 'xatrix.sh' 'rogue.sh' 'ctf.sh' 'snd_alsa.c' 'gnusource.patch')
md5sums=('6b0e3fff324a5db58a8f8309dcabb47a'
         '04d3f1fb7fb4dada7175a41f4595c7eb'
         '41fc4ecc4f25c068e7d1f488bd4a1e1a'
         '7d5e052839c9e629bad0a6570aa70554'
         '490557d4a90ff346a175d865a2bade87'
         'ec5664163c74b4648b9782a0d844b26a'
         '77f6156b5cb3e7f72e7eb69710a91db2'
         '06fa0aff03dae18ae003699ce514046c'
         '396d146a53a2f9637f18d53e1bb0d877'
         '2c3f56b44d1f5e7f6b46e31877e190e0'
         'c16644a6ddf93159ccc71e4c06e312c4'
         '5788ed0d1bde8b00fa8b91a0c865f427')

build() {
    cd $srcdir

    # Create Temporary Directories
    install -d $pkgname-$pkgver/src/xatrix $pkgname-$pkgver/src/rogue

    # Decompress and patch The Reckoning (xatrix) Expansion
    cp $srcdir/xatrixsrc320.shar.Z $srcdir/$pkgname-$pkgver/src/xatrix
    cd $srcdir/$pkgname-$pkgver/src/xatrix
    uncompress xatrixsrc320.shar.Z
    sh xatrixsrc320.shar
    /bin/sed -e "s/extern\tint\tjacket_armor_index/static\tint\tjacket_armor_index/" -i g_local.h
    /bin/sed -e "s/extern\tint\tcombat_armor_index/static\tint\tcombat_armor_index/" -i g_local.h
    /bin/sed -e "s/extern\tint\tbody_armor_index/static\tint\tbody_armor_index/" -i g_local.h

    # Decompress and patch Ground Zero (rouge) Expansion
    cp $srcdir/roguesrc320.shar.Z $srcdir/$pkgname-$pkgver/src/rogue
    cd $srcdir/$pkgname-$pkgver/src/rogue
    uncompress roguesrc320.shar.Z
    sh roguesrc320.shar
    /bin/sed -e "s/#include <nan.h>/#include <bits\/nan.h>/" -i g_local.h
    /bin/sed -e "s/extern\tint\tjacket_armor_index/static\tint\tjacket_armor_index/" -i g_local.h
    /bin/sed -e "s/extern\tint\tcombat_armor_index/static\tint\tcombat_armor_index/" -i g_local.h
    /bin/sed -e "s/extern\tint\tbody_armor_index/static\tint\tbody_armor_index/" -i g_local.h

    cd $srcdir/$pkgname-$pkgver/

    # Patch from SVN
    cp $srcdir/snd_alsa.c ./src/linux/snd_alsa.c

    # x86_64 patch from Gentoo
    patch -p1 < $srcdir/gnusource.patch

    # Compile Quake 2
    make -s BUILD_XATRIX=YES BUILD_ROGUE=YES BUILD_DEDICATED=YES BUILD_CTF=YES BUILD_QMAX=YES build_release || return 1

    [ "$CARCH" = "i686" ] && _dirarch=i386
    [ "$CARCH" = "x86_64" ] && _dirarch=x86_64

    cd $srcdir/$pkgname-$pkgver/release$_dirarch

    # Create Destination Directories
    install -d $pkgdir/opt/quake2/{baseq2,ctf,xatrix,rogue}

    # Install Base Game Library
    install -m 755 game$_dirarch.so $pkgdir/opt/quake2/baseq2/
    cp * $pkgdir/opt/quake2/

    # Install CTF Library
    install -m 755 ctf/game$_dirarch.so $pkgdir/opt/quake2/ctf/

    # Install Xatrix Library
    install -m 755 xatrix/game$_dirarch.so $pkgdir/opt/quake2/xatrix/

    # Install Rogue Library
    install -m 755 rogue/game$_dirarch.so $pkgdir/opt/quake2/rogue/

    cd $srcdir

    # Install Pak File
    install $srcdir/maxpak.pak $pkgdir/opt/quake2/baseq2/

    # Decompress and Install CTF Patch Data
    mkdir $srcdir/q2
    cp $srcdir/q2-3.20-x86-full-ctf.exe $srcdir/q2
    cd $srcdir/q2
    unzip -L q2-3.20-x86-full-ctf.exe
    cp baseq2/pak1.pak baseq2/pak2.pak $pkgdir/opt/quake2/baseq2/
    cp -r baseq2/players $pkgdir/opt/quake2/baseq2/
    cp ctf/* $pkgdir/opt/quake2/ctf/

    cd $srcdir

    # x86_64 has the default ref_softx.so disabled, use glx
    if [ "$CARCH" = "x86_64" ]; then
        /bin/sed -e 's|/quake2 |/quake2 +set vid_ref glx |' -i *.sh
    fi

    # Install Game Launchers
    install -D -m 755 quake2.sh $pkgdir/usr/bin/quake2
    install -D -m 755 q2ded.sh  $pkgdir/usr/bin/q2ded
    install -D -m 755 xatrix.sh $pkgdir/usr/bin/quake2-the-reckoning
    install -D -m 755 rogue.sh  $pkgdir/usr/bin/quake2-ground-zero
    install -D -m 755 ctf.sh    $pkgdir/usr/bin/quake2-ctf
}

