# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>
# Contributor: Babets

pkgname=doom3-bin
pkgver=1.3.1.1304
pkgrel=1
pkgdesc='The stock Doom 3 binaries. Punkbuster compatible. You need the retail .pk4 files to play.'
url='http://www.doom3.com/'
license=('custom:"DOOM 3"' 'custom:"PunkBuster"')
depends_i686=('libxext' 'libgl' 'alsa-lib>=1.0.6')
depends_x86_64=('lib32-gcc-libs' 'lib32-libxdamage' 'lib32-libxext' 'lib32-libgl' 'lib32-alsa-lib>=1.0.6' 'lib32-libstdc++5' 'lib32-openal')
arch=('i686' 'x86_64')
install=doom3.install
source=('doom3.launcher' 'doom3-dedicated.launcher' 'doom3.desktop' \
'doom3.launcher64' 'doom3-dedicated.launcher64' 'doom3.png' \
"http://slashbunny.com/aur/doom3/doom3-linux-$pkgver.x86.run")
provides=('doom3')
conflicts=('doom3')
sha256sums=('ea9fe17fdb19cfe8a22e2b7859093f7a76eeaa51fd2571507b6dc37462515f21'
            'f7aa055489f581e3da3001b23becef68586b0994da70ee138425926fc580b204'
            'f9199b09981bb1fffba0f17a71e01021e4ea4aae6d99e553aa00c74d576e812b'
            '718378f2c3c42d56b916e9341e01261a2cfad5fb60ef15cc57954d1a4ce2a94e'
            'e6654e29773b5ed01f897294ecbc21a84dcb59afc30cb60eb0d5a3c03c7d3de1'
            'c9a701498a7b0f923182bf9f11aac8d2193026e509ae3643a5bc118b1a458c6b'
            '2f90dff20f2d3c0c47f17b3d6d45c4f0e7d27b986bf6084f21b85180cd1e03b4')

build() {
    cd $srcdir

    # Make Installer Executable
    chmod +x $srcdir/doom3-linux-$pkgver.x86.run

    # Extract Game Files
    ./doom3-linux-$pkgver.x86.run --tar xf
}

package() {
    # Create Destination Directories
    install -d $pkgdir/opt/doom3/{base,d3xp,pb/htm}

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

    # Remove Bundled Libraries (Doom3 will use the System Libraries)
    rm $pkgdir/opt/doom3/{libgcc_s.so.1,libstdc++.so.6}
}
