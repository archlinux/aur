# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>
# Contributor: Babets
# Contributor: Paolo Bolzoni

pkgname=doom3
pkgver=1.3.1.1304
pkgrel=12
pkgdesc='Doom 3 Engine. You need the retail .pk4 files to play.'
url='http://www.doom3.com/'
license=('custom:"DOOM 3"')
arch=('i686' 'x86_64')
if [ "$CARCH" = "i686"   ]; then
    depends=('libgl' 'alsa-lib' 'openal' 'libxxf86vm' 'libstdc++5')
    makedepends=('scons' 'zip')
    optdepends=(
        'alsa-plugins: pulseaudio-support'
        'libpulse: pulseaudio support'
    )
fi
if [ "$CARCH" = "x86_64" ]; then
    depends=('lib32-libgl' 'lib32-alsa-lib' 'lib32-openal' 'lib32-libxxf86vm' 'lib32-libstdc++5')
    makedepends=('scons' 'gcc-multilib' 'zip')
    optdepends=(
        'lib32-alsa-plugins: pulseaudio-support'
        'lib32-libpulse: pulseaudio support'
    )
fi
install=doom3.install
source=('doom3.launcher' 'doom3-dedicated.launcher' 'doom3.desktop' \
    'doom3.launcher64' 'doom3-dedicated.launcher64' 'doom3.png' \
    "http://pnfiles.gamespy.com/hostedftp/planetdoom/fms/files/other/38/idtech4doom3sourceGPL.zip" \
    "http://www.1337-server.net/doom3/$pkgname-linux-$pkgver.x86.run")
provides=('doom3')
conflicts=('doom3-bin' 'iodoom3' 'iodoom3-git' 'iodoom3-bin')
md5sums=('da5f33feaa929c2c588a5a773c777e0f'
         '6bdef1e111e5f450bca3f1c043caf4a2'
         'facb0291279621d997f9504924d7e9b1'
         '7ccbdd8f07672c6c34b2fe1de131e57c'
         'aca58ca787ac3c2c44eea46b08a5a3c1'
         'f99eb141eecc4b9dd188d6819d741546'
         '8ef8ab167d89ffa801e974722391d3c0'
         '6325f0936f59420d33668754032141cb')

build() {
    cd $srcdir/doom3.gpl/neo

    # Build Binaries from Source
    scons NOCURL=1 BUILD=release BUILD_GAMEPAK=1

    cd $srcdir

    # Make Installer Executable
    chmod +x $srcdir/doom3-linux-$pkgver.x86.run

    # Extract Game Files
    ./doom3-linux-$pkgver.x86.run --tar xf
}

package() {
    cd $srcdir

    # Create Destination Directories
    install -d $pkgdir/opt/doom3/{base,d3xp}

    # Install Game Binaries
    install -m 755 $srcdir/doom3.gpl/neo/doom.x86 \
        $pkgdir/opt/doom3

    # Install Game Files
    install -m 644 base/pak00*.pk4 $pkgdir/opt/doom3/base
    install -m 644 d3xp/pak00*.pk4 $pkgdir/opt/doom3/d3xp
    install -m 644 {CHANGES,README,version.info} $pkgdir/opt/doom3
    install -m 644 $srcdir/doom3.gpl/neo/game01-base.pk4 \
        $pkgdir/opt/doom3/base/game01.pk4
    install -m 644 $srcdir/doom3.gpl/neo/game01-d3xp.pk4 \
        $pkgdir/opt/doom3/d3xp/game01.pk4

    if [ "$CARCH" == "i686" ]; then
        # Install Game Launcher (Client)
        install -D -m 755 $srcdir/doom3.launcher \
            $pkgdir/usr/bin/doom3

        # Install Game Launcher (Server)
        install -D -m 755 $srcdir/doom3-dedicated.launcher \
            $pkgdir/usr/bin/doom3-dedicated
    else
        # Install Game Launcher (Client)
        install -D -m 755 $srcdir/doom3.launcher64 \
            $pkgdir/usr/bin/doom3

        # Install Game Launcher (Server)
        install -D -m 755 $srcdir/doom3-dedicated.launcher64 \
            $pkgdir/usr/bin/doom3-dedicated
    fi

    # Install License (DOOM 3)
    install -D -m 644 $srcdir/License.txt \
        $pkgdir/usr/share/licenses/$pkgname/license.txt

    # Install Icon
    install -D -m 644 $srcdir/doom3.png \
        $pkgdir/usr/share/pixmaps/doom3.png

    # Install Desktop File
    install -D -m 644 $srcdir/doom3.desktop \
        $pkgdir/usr/share/applications/doom3.desktop
}
