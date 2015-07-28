# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Capi Etheriel <barraponto AT gmail DOT com>
# Based on work by Malte Wessel <muunleit AT lavabit DOT com>

pkgname=atomzombiesmasher-hib
pkgver=1.953+h20130409
_hibver=v1_953-er
pkgrel=2
pkgdesc="A 2D tactics/strategy game where you evacuate civilians from zombie-infested cities. (Humble Bundle/Store version)"
arch=('any')
url="http://blendogames.com/atomzombiesmasher/"
license=("custom:commercial")
depends=('mono' 'libgdiplus' 'csfml-bin' 'openal' 'flac' 'libpng12' 'libjpeg6' 'libtiff3' 'xdg-utils')
conflicts=("atomzombiesmasherdemo" "atomzombiesmasher" "atomzombiesmasher-demo")
replaces=("atomzombiesmasher")
PKGEXT='.pkg.tar'

_gamepkg="atomzombiesmasher_$_hibver.tar.gz"
source=("$_gamepkg::hib://$_gamepkg"
        "atomzombiesmasher.desktop"
        "https://apps.ubuntu.com/site_media/icons/2013/12/atom-zombie-smashertCCn9V.png")
md5sums=("6902c845a21e92c62f5b33b38715c797"
         "b1f2e18834d1bec5785a889f642e2191"
         "341ce551a8525be96d6c59c1bf9efd2a")

_installname=atomzombiesmasher
case $CARCH in
    i686)   _lib=lib; _libother=lib64 ;;
    x86_64) _lib=lib64; _libother=lib ;;
esac

prepare() {
    cd atomzombiesmasher
    
    msg2 "Prepare launch script..."
    echo -e "#!/usr/bin/sh\n" \
            "export MONO_WINFORMS_XIM_STYLE=disabled\n" \
            "cd /opt/$_installname\n" \
            "exec mono AtomZombieSmasher.exe" '"$@"' \
        > game/$_installname
    
    msg2 "Fix permissions..."
    find -type f -exec chmod 644 {} \;
    chmod 755 game/$_installname
    
    msg2 "Remove unneeded files..."
    rm game/AtomZombieSmasher.bin.*
    rm -r game/$_libother
    rm -r game/$_lib/{libmono*,libMono*,libcsfml*,libsfml*}
    rm -r game/$_lib/{libopenal.so.1,libFLAC.so.8,libgdiplus.so}
    rm -r game/$_lib/{libjpeg.so.62,libpng12.so.0,libtiff.so.3}
    rm -r game/{mono,{Accessibility,Mono*,mscorlib,System*}.dll}
    
    # Set apart files to install separately
    mv readme.html "$srcdir"
}

package() {
    # Game data
    install -g games -d "$pkgdir"/opt/$_installname
    cp -rT $_installname/game "$pkgdir"/opt/$_installname
    
    # Readme
    install -Dm644 readme.html \
                   "$pkgdir"/usr/share/doc/$_installname/readme.html
    
    # Desktop entry
    install -Dm644 $_installname.desktop \
                   "$pkgdir"/usr/share/applications/$_installname.desktop
    install -Dm644 atom-zombie-smashertCCn9V.png \
                   "$pkgdir"/usr/share/pixmaps/$_installname.png
    
    # Launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/$_installname/$_installname "$pkgdir"/usr/bin/$_installname
}
