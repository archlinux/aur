# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>
# Contributor: Babets

pkgname=doom3
pkgver=1.3.1.1304
pkgrel=5
pkgdesc='Doom 3 Engine. You need the retail .pk4 files to play.'
url='http://www.doom3.com/'
license=('custom:"DOOM 3"' 'custom:"PunkBuster"')
[ "$CARCH" = "i686"   ] && depends=('libxext' 'libgl' 'alsa-lib>=1.0.6')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libxdamage' 'lib32-libxext' 'lib32-libgl' 'lib32-alsa-lib>=1.0.6')
arch=('i686' 'x86_64')
install=doom3.install
source=('doom3.launcher' 'doom3-dedicated.launcher' 'doom3.desktop' \
'doom3.launcher64' 'doom3-dedicated.launcher64' 'doom3.png' \
"http://www.1337-server.net/doom3/$pkgname-linux-$pkgver.x86.run")
md5sums=('29335683bcc2c3063bd9af015025cc38'
         'a13dc5cdb4b0f6ead3344673b185c53d'
         'facb0291279621d997f9504924d7e9b1'
         '15d33c9f7e1b1c3d2f8cb01c9e68ed97'
         'bfeb2be83024d60ccda658e4d60b6e13'
         'f99eb141eecc4b9dd188d6819d741546'
         '6325f0936f59420d33668754032141cb')

build() {
    cd $srcdir

    # Create Destination Directories
    install -d $pkgdir/opt/doom3/{base,d3xp,pb/htm}

    # Make Installer Executable
    chmod +x $srcdir/doom3-linux-$pkgver.x86.run

    # Extract Game Files
    ./doom3-linux-$pkgver.x86.run --tar xf

    # Install Game Files
    install -m 644 base/*   $pkgdir/opt/doom3/base
    install -m 644 d3xp/*   $pkgdir/opt/doom3/d3xp
    install -m 644 pb/htm/* $pkgdir/opt/doom3/pb/htm
    install -m 644 {CHANGES,README,version.info} $pkgdir/opt/doom3

    # Install Game Libraries
    install -m 755 $srcdir/{libgcc_s.so.1,libstdc++.so.6} \
        $pkgdir/opt/doom3

    # Install Punkbuster Libraries
    install -m 755 $srcdir/pb/{pbag.so,pbags.so,pbcl.so,pbcls.so,pbsv.so} \
        $pkgdir/opt/doom3/pb

    # Install Game Binaries
    install -m 755 $srcdir/bin/Linux/x86/{doom.x86,doomded.x86} \
        $pkgdir/opt/doom3

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

    # Install License (Punkbuster)
    install -D -m 644 $srcdir/pb/PB_EULA.txt \
        $pkgdir/usr/share/licenses/$pkgname/PB_EULA.txt

    # Install Icon
    install -D -m 644 $srcdir/doom3.png \
        $pkgdir/usr/share/pixmaps/doom3.png

    # Install Desktop File
    install -D -m 644 $srcdir/doom3.desktop \
        $pkgdir/usr/share/applications/doom3.desktop

    # Remove Bundled Libraries for x86 (Doom3 will use the System Libraries)
    if [ "$CARCH" == "i686" ]; then
        rm $pkgdir/opt/doom3/{libgcc_s.so.1,libstdc++.so.6}
    fi
}
