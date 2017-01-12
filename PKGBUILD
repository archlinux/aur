# Maintainer: Sam S. <smls75@gmail.com>

pkgname=capsized-hib
pkgver=1+h20151221
_hibver=12212015
pkgrel=1
pkgdesc='A science-fiction action platformer (Humble Bundle version)'
url='http://www.capsizedgame.com/'
arch=('i686' 'x86_64')
license=('custom:commercial')
depends=('openal' 'libtheora' 'libvorbis' 'gcc-libs')
makedepends=('imagemagick')
options=('!strip' '!upx')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://capsized-$_hibver-bin"
        'capsized-hib.desktop')
md5sums=('10515ca5f73e38151e17766cba97f3ed'
         'a6f5bc2ddf20690545cf095d59eec37b')

_installdir="/opt/Capsized"

prepare() {
    # Remove files of wrong architecture
    [ $CARCH == "i686"   ] && rm -r "data/"{lib64,NePlusUltra.bin.x86_64}
    [ $CARCH == "x86_64" ] && rm -r "data/"{lib,NePlusUltra.bin.x86}
    
    # Remove bundled libraries (use distro versions instead)
    rm "data/lib"*/{libogg.so.0,libopenal.so.1,libtheora.so.0,libtheoradec.so.1}
    rm "data/lib"*/{libvorbis.so.0,libvorbisfile.so.3}
    
    # Set aside files for separate installation
    mv "data/Linux.README" .
    
    # Generate icon
    convert "data/Capsized.bmp" -resize 256x256 "capsized.png"
    rm "data/Capsized.bmp"
    
    # Generate launch script
    [ $CARCH == "i686" ] && _arch='x86' || _arch='x86_64'
    echo -e "#!/bin/sh\ncd $_installdir && ./NePlusUltra.bin.$_arch" > "launcher.sh"
}

package() {
    cd $srcdir
    
    # Install game files
    mkdir -p "$pkgdir/$_installdir"
    cp -alrT "data" "$pkgdir/$_installdir"
    
    # Install desktop entry & icon
    install -Dm644 "$pkgname.desktop" \
                   "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "capsized.png" "$pkgdir/usr/share/pixmaps/capsized.png"
    
    # Install launch script
    install -Dm755 "launcher.sh" "$pkgdir/usr/bin/capsized"
    
    # Install docs
    install -Dm644 "Linux.README" \
                   "$pkgdir"/usr/share/doc/$pkgname/Linux.README
}
