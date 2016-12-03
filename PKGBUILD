# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Capi Etheriel <barraponto AT gmail DOT com>
# Based on work by Malte Wessel <muunleit AT lavabit DOT com>

pkgname=atomzombiesmasher-hib
pkgver=2+h20161017
_hibver=10172016
pkgrel=1
pkgdesc="A 2D tactics/strategy game where you evacuate civilians from zombie-infested cities. (Humble Bundle/Store version)"
arch=('any')
url="http://blendogames.com/atomzombiesmasher/"
license=("custom:commercial")
depends=('mono' 'openal' 'flac' 'xdg-utils')
conflicts=("atomzombiesmasherdemo" "atomzombiesmasher" "atomzombiesmasher-demo")
replaces=("atomzombiesmasher")
PKGEXT='.pkg.tar'

_gamepkg="atomzombiesmasher-$_hibver-bin"
source=("$_gamepkg::hib://$_gamepkg"
        "atomzombiesmasher.desktop"
        "https://apps.ubuntu.com/site_media/icons/2013/12/atom-zombie-smashertCCn9V.png")
md5sums=('af521890276792589bdfd5f1882a8c2b'
         'b1f2e18834d1bec5785a889f642e2191'
         '341ce551a8525be96d6c59c1bf9efd2a')

_installname=atomzombiesmasher
case $CARCH in
    i686)   _lib=lib; _libother=lib64 ;;
    x86_64) _lib=lib64; _libother=lib ;;
esac

prepare() {
    msg2 "Prepare launch script..."
    echo -e "#!/usr/bin/sh\n" \
            "export MONO_WINFORMS_XIM_STYLE=disabled\n" \
            "cd /opt/$_installname\n" \
            "export LD_LIBRARY_PATH='./$_lib:\$LD_LIBRARY_PATH'\n" \
            'exec mono AtomZombieSmasher.exe "$@"' \
        > data/$_installname
    
    msg2 "Fix permissions..."
    find -type f -exec chmod 644 {} \;
    chmod 755 data/$_installname
    
    msg2 "Remove unneeded files..."
    rm data/AtomZombieSmasher{,.bin.*}
    rm data/$_lib/{libopenal.so.1,libSDL2-2.0.so.0}
    rm data/{Mono*,System*,mscorlib}.dll
    rm -r data/$_libother
    
    # Set apart files to install separately
    mv data/Linux.README .
}

package() {
    # Game data
    install -g games -d "$pkgdir"/opt/$_installname
    cp -rT data "$pkgdir"/opt/$_installname
    
    # Readme
    install -Dm644 Linux.README \
                   "$pkgdir"/usr/share/doc/$_installname/Linux.README
    
    # Desktop entry
    install -Dm644 $_installname.desktop \
                   "$pkgdir"/usr/share/applications/$_installname.desktop
    install -Dm644 atom-zombie-smashertCCn9V.png \
                   "$pkgdir"/usr/share/pixmaps/$_installname.png
    
    # Launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/$_installname/$_installname "$pkgdir"/usr/bin/$_installname
}
