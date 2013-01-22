# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ioquake3-git
pkgver=20130121
pkgrel=1
pkgdesc="The de-facto OSS Quake 3 distribution. You need the retail/demo .pk3 files to play."
url="http://ioquake3.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl' 'openal')
makedepends=('nasm' 'git')
conflicts=('quake3' 'quake3-icculus-svn' 'quake3-svn' 'ioquake3-svn')
provides=('quake3' 'ioquake3')
replaces=('quake3-icculus-svn' 'ioquake3-svn')
install=quake3.install
source=('quake3.desktop' 'quake3.launcher' 'quake3ded.launcher' \
'http://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake3/linux/linuxq3apoint-1.32b-3.x86.run')
md5sums=('9eca51e2b3ee3e0100944cba436a2a4c'
         'ea5d99df80b41269523b34229fdf854d'
         'ea5d99df80b41269523b34229fdf854d'
         'c71fdddccb20e8fc393d846e9c61d685')

_gitroot=git://github.com/ioquake/ioq3.git
_gitname=quake3

build() {
    cd $srcdir

    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    # Modify Makefile to correct install path
    /bin/sed -i "s:/usr/local/games/quake3:$pkgdir/opt/quake3:" Makefile

    # Compile ioQuake3
    make || return 1
}

package() {
    cd "$srcdir/$_gitname-build"

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
    install -D -m 644 $srcdir/quake3-build/misc/quake3.png \
        $pkgdir/usr/share/pixmaps/quake3.png
}
