# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=savage
pkgver=2.00e
pkgrel=8
pkgdesc="Savage: The Battle for Newerth is an online multiplayer team-based FPS/RTS hybrid. Completely free as of September 2006. (Includes SFE Patches)"
url="http://s2games.com/savage"
arch=('i686' 'x86_64')
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-sdl' 'lib32-mesa' 'lib32-libjpeg6' 'lib32-e2fsprogs' 'lib32-glib2' 'lib32-pcre' 'lib32-zlib' 'lib32-freetype2' 'lib32-libxdamage')
else
    depends=('libgl' 'sdl' 'glib2' 'mesa' 'libjpeg6' 'libpng' 'libidn' 'e2fsprogs' 'curl' 'openssl')
fi
makedepends=('unzip')
install=savage.install
source=('savage.i686.launcher' 'savage.x86_64.launcher' 'savage.desktop' 'icon.xpm' \
'http://newerth.com/downloads/lin-client-auth-patch.zip' \
'http://www.notforidiots.com/SFE/SFE-Standalone.tar.gz')
md5sums=('1588610be6fe7c52eda37fee65ca16c4'
         '2129b16867cd875ce05a8f5f400ca967'
         '1fcb84c031b22b73fd803a6e2a611aca'
         'a73f68e3620382860b08e88c1125f55d'
         '7fb1e0b31e838ea335a35c769c4549d8'
         '3ce0c50e3d5e4ff6789122c5076fb66b')

build() {
    cd $startdir/src/

    # Make Destination Game Directory
    install -d $startdir/pkg/opt/savage

    # Install Game
    tar zxf $startdir/src/SFE-Standalone.tar.gz -C $startdir/pkg/opt/savage/

    # Install Client Auth Patch
    install -m 755 $startdir/src/lin-client-auth-patch/silverback.bin \
        $startdir/pkg/opt/savage/silverback.bin

    install -m 755 $startdir/src/lin-client-auth-patch/game/game.so \
        $startdir/pkg/opt/savage/game/game.so

    install -m 755 $startdir/src/lin-client-auth-patch/libs/libpng12.so.0 \
        $startdir/pkg/opt/savage/libs/libpng12.so.0

    # Install Launcher Script
    install -D -m 755 $startdir/src/savage.$CARCH.launcher \
        $startdir/pkg/usr/bin/savage

    # Install License
    install -D -m 644 $startdir/src/licenses.txt \
        $startdir/pkg/usr/share/licenses/$pkgname/licenses.txt

    # Install Icon
    install -D -m 644 $startdir/src/icon.xpm \
        $startdir/pkg/usr/share/pixmaps/savage.xpm

    # Install Desktop File
    install -D -m 644 $startdir/src/savage.desktop \
        $startdir/pkg/usr/share/applications/savage.desktop

    # Create Log File
    touch $startdir/pkg/opt/savage/scripts.log

    # Set Ownership to root:games 
    chown -R root:games $startdir/pkg/opt/savage
    chmod -R g+w $startdir/pkg/opt/savage
}
