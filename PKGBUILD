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
'http://www.freespacemods.net/e107_files/downloads/BtRLDemoInstaller.run'
'http://www.fsoinstaller.com/files/btrl/btrlpatch_linux.tar.gz'
'http://www.fsoinstaller.com/files/btrl/w_patch2.vp'
'http://www.fsoinstaller.com/files/btrl/x_patch1.vp'
'http://www.fsoinstaller.com/files/btrl/y_patch1.vp')
sha256sums=('d4d608fe7c0771523c40eda8f47388db46810d613997a1ea39aaa6a01a83313f'
            'a56e8e9a9e494f9bb79222c84aaf2d1a6c1795bc53383c3d90b4c7919c1c2807'
            '6a49431b37808cac690473e5df8bdb9be3af0d06eff933ddde6b4852c57cd340'
            'd274607b134c0c4d6b50bdb14724fb2199b1eb7fb9cb97d2dada2434bd6a07d0'
            '3d1f5cd7e13e35cdfe98dbaff0063eea51124862d91fa5fd7485cdb542b98bee'
            '98ccc633aad0f4a61de129cdec457d6809e1098df151a873c16eaf94e7c8d66b'
            '6a20720b25b17cdf028fa8ee74674148001e81c8b88f57c4049e23ab6064b054')

package() {
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
