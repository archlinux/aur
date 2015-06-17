#Mantainer: M0Rf30

pkgname=watermint-git
pkgver=2614.2ecf2c5
pkgrel=1
pkgdesc="A realistic version of Spearmint (ioquake3 fork) for future development with open-sourced realism-based first person shooters."
url="https://github.com/Watermint-Game"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl' 'openal' 'freetype2' 'libvorbis' 'opus' 'opusfile' 'libogg' 'speex' 'zlib' 'libjpeg-turbo')
makedepends=('nasm' 'git')
conflicts=('watermint' 'watermint-icculus-svn' 'watermint-svn' 'iowatermint-svn')
provides=('watermint' 'iowatermint')
replaces=('watermint-icculus-svn' 'iowatermint-svn')
install=watermint-git.install
source=('watermint::git://github.com/Watermint-Game/watermint-code.git'
	'watermint.desktop' 'watermint.launcher' 'watermintded.launcher' 'PAKSUMS' \
	'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run')



build() {
    cd watermint

    # Modify Makefile to correct install path
    sed -i "s:/usr/local/games/quake3:$pkgdir/opt/watermint:g" Makefile
    
    # Compile watermint
    make USE_INTERNAL_FREETYPE=0 USE_INTERNAL_FREETYPE=0 USE_INTERNAL_VORBIS=0 \
	 USE_INTERNAL_OGG=0 USE_INTERNAL_SPEEX=0 USE_INTERNAL_ZLIB=0 \
	 USE_INTERNAL_JPEG=0 JPDIR=/usr/include SPEEXDIR=/usr/include/speex \
	 OGGDIR=/usr/include/ogg || return 1
}

package() {
    cd watermint

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
        sed -i "s:WAT_BINARY:watermint.x86_64:" \
            $srcdir/watermint.launcher
        sed -i "s:WAT_BINARY:watermint-server.x86_64:" \
            $srcdir/watermintded.launcher
    else
        #
        # i686 Systems
        #
        sed -i "s:WAT_BINARY:watermint.i386:" \
        $srcdir/watermint.launcher
        sed -i "s:WAT_BINARY:watermint-server.i386:" \
        $srcdir/watermintded.launcher
    fi

    # Install Quake 3 Patch Files
    install -m 644 $srcdir/baseq3/*.pk3 $pkgdir/opt/watermint/mpbase/

#    # Install Quake 3 Expansion Pack Patch Files
#    install -m 644 $srcdir/missionpack/*.pk3 $pkgdir/opt/watermint/mpbase/

    # Install PAKSUMS
    install -m 644 $srcdir/PAKSUMS $pkgdir/opt/watermint/mpbase/

    # Install Launcher (Client)
    install -D -m 755 $srcdir/watermint.launcher $pkgdir/usr/bin/watermint

    # Install Launcher (Server)
    install -D -m 755 $srcdir/watermintded.launcher $pkgdir/usr/bin/watermintded

    # Install Desktop File
    install -D -m 644 $srcdir/watermint.desktop $pkgdir/usr/share/applications/watermint.desktop

    # Install Icon File
    install -D -m 644 $srcdir/watermint/misc/quake3-tango.png $pkgdir/usr/share/pixmaps/watermint.png
}

pkgver() {
    cd watermint
    echo $(git rev-list --count master).$(git rev-parse --short master)
}
md5sums=('SKIP'
         '21de34564d534404b7bd7a7cc0791191'
         'b2dcf2080a5c183047f94fda48626550'
         'b2dcf2080a5c183047f94fda48626550'
         'e024e9f565660747daf77215cd2ff1d1'
         'c71fdddccb20e8fc393d846e9c61d685')
