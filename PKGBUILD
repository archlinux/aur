# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Marek Otahal <markotahal gmail>
# Contributor: C5OK5Y 
# Contributor: N30N <archlinux@alunamation.com>

pkgname=osmos
pkgver=1.6.1+h20110216
_hibver=1.6.1
pkgrel=1
pkgdesc="A unique physics-based ambient game (Humble Bundle/Store version)"
arch=("i686" "x86_64")
url="http://www.hemispheregames.com/osmos/"
license=("custom: commercial")
depends=("glu" "freetype2" "libvorbis" "openal")
install='osmos.install'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://Osmos_$_hibver.tar.gz"
        "osmos.desktop")
md5sums=("ed2cb029c20c25de719c28062e6fc9cf"
         "030de4b7f794aaab819273bba8edf05d")

_installname=osmos
case $CARCH in
    i686)   _arch=bin32; _other=bin64; ;;
    x86_64) _arch=bin64; _other=bin32; ;;
esac

prepare() {
    # Create custom launcher
    echo -e "#!/usr/bin/sh\n" \
            "cd /opt/$_installname\n" \
            "exec ./Osmos.$_arch" '"$@"' \
        > "launcher.sh"
    
    # Remove unneeded files
    rm Osmos/{Osmos,Osmos.$_other}
    
    # Set apart files to install separately
    mv Osmos/{readme.html,eula.txt} "$srcdir"
    
    # Patch sound issue
    sed -ri 's/^(soundDevice ")-/\1/' Osmos/defaults.cfg
}

package() {
    # Game data
    install -g games -d "$pkgdir"/opt/$_installname
    cp -rT Osmos "$pkgdir"/opt/$_installname
    
    # Launcher
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/$_installname
    
    # Desktop entry
    install -Dm644 osmos.desktop \
                   "$pkgdir"/usr/share/applications/osmos.desktop
    
    # Icon
    for i in 16x16 22x22 32x32 48x48 64x64 72x72 96x96 128x128 192x192 256x256; do
        install -Dm644 Osmos/Icons/$i.png \
                       "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_installname.png
    done
    
    # License and documentation
    install -Dm644 eula.txt \
                   "$pkgdir"/usr/share/licenses/$_installname/LICENSE
    install -Dm644 readme.html \
                   "$pkgdir"/usr/share/doc/$_installname/readme.html
}
