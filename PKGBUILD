# Contributor: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=btrl
pkgver=demo
pkgrel=2
pkgdesc="Beyond the Red Line is a completely free stand-alone conversion of Freespace 2 based on the TV show Battlestar Galactica"
url='http://www.beyondtheredline.net/'
arch=('i686' 'x86_64')
license=('custom')
depends=('libgl' 'libtheora' 'libvorbis' 'mesa' 'openal' 'sdl')
source=('btrl.desktop' 'btrl.launcher'
'ftp://ftp.unreal.ie/unreal.ie/non-unreal/BtRLDemoInstaller.run'
'http://www.fsoinstaller.com/files/btrl/btrlpatch_linux.tar.gz'
'http://www.fsoinstaller.com/files/btrl/w_patch2.vp'
'http://www.fsoinstaller.com/files/btrl/x_patch1.vp'
'http://www.fsoinstaller.com/files/btrl/y_patch1.vp')
md5sums=('3acd39a97465576bbb28855c025b987a'
         'b4988100342221dacdc9e011db07a57e'
         'f11b425f3aeb9acba9a180cfc4dafcf0'
         '048d91174c0ede75cf428406a444db56'
         'b656b65b3832e5cbb6f87afb7280f1d5'
         '3c6f15f5e21da5fa89a656993f919ac7'
         '22602aa184842d80812aba04ca51cbaa')

build () {
    cd $srcdir

    # Create Destination Directory
    install -d $pkgdir/opt/btrl

    # Extract Data from the Installer
    chmod +x $srcdir/BtRLDemoInstaller.run
    ./BtRLDemoInstaller.run --noexec --tar xvf

    # Extract Game Data into Destination Directory
    bsdtar -x -o -C $pkgdir/opt/btrl -f $srcdir/game_data.tar

    # Extract Game Libaries into Destination Directory
    bsdtar -x -o -C $pkgdir/opt/btrl -f $srcdir/libs.tar

    # Remove Bad Files
    rm $pkgdir/opt/btrl/data/freddocs/Thumbs.db

    # Copy README File
    install -D -m 644 $srcdir/README \
        $pkgdir/opt/btrl/README

    # Install Binaries based on Archetecture
    if [ "$CARCH" = "x86_64" ]; then
        #
        # x86_64 Systems (Use unpatched binaries)
        #
        install -D -m 755 $srcdir/bin/Linux/x86_64/glibc-2.1/btrl_demo \
            $pkgdir/opt/btrl/btrl_demo
        install -D -m 755 $srcdir/bin/Linux/x86_64/glibc-2.1/btrl_demo.bin \
            $pkgdir/opt/btrl/btrl_demo.bin
    else
        #
        # i686 Systems (Use patched binaries)
        #
        install -D -m 755 $srcdir/btrl_demo \
            $pkgdir/opt/btrl/btrl_demo
        install -D -m 755 $srcdir/btrl_demo.bin \
            $pkgdir/opt/btrl/btrl_demo.bin

        # Install Patch Data
        install -D -m 644 $srcdir/w_patch2.vp \
          $pkgdir/opt/btrl/w_patch2.vp

        install -D -m 644 $srcdir/x_patch1.vp \
          $pkgdir/opt/btrl/x_patch1.vp

        install -D -m 644 $srcdir/y_patch1.vp \
          $pkgdir/opt/btrl/y_patch1.vp
    fi

    # Install Launcher
    install -D -m 755 $srcdir/btrl.launcher \
        $pkgdir/usr/bin/btrl

    # Install Desktop File
    install -D -m 644 $srcdir/btrl.desktop \
        $pkgdir/usr/share/applications/btrl.desktop

    # Install Icon File
    install -D -m 644 $srcdir/btrl.png \
        $pkgdir/usr/share/pixmaps/btrl.png
}
