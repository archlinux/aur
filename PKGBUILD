# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Capi Etheriel <barraponto AT gmail DOT com>
# Based on work by Malte Wessel <muunleit AT lavabit DOT com>

pkgname=atomzombiesmasher-hib
pkgver=1.953+h20130409
_hibver=v1_953-er
pkgrel=1
pkgdesc="A 2D tactics/strategy game where you evacuate civilians from zombie-infested cities. (Humble Bundle/Store version)"
arch=('any')
url="http://blendogames.com/atomzombiesmasher/"
license=("custom:commercial")
depends_x86_64=('libgdiplus' 'mono' 'csfml-bin')
conflicts=("atomzombiesmasherdemo" "atomzombiesmasher")

_gamepkg="atomzombiesmasher_$_hibver.tar.gz"
source=("$_gamepkg::hib://$_gamepkg"
        "atomzombiesmasher.desktop"
        "https://apps.ubuntu.com/site_media/icons/2013/12/atom-zombie-smashertCCn9V.png")
md5sums=("6902c845a21e92c62f5b33b38715c797"
         "b1f2e18834d1bec5785a889f642e2191"
         "341ce551a8525be96d6c59c1bf9efd2a")

_installname=atomzombiesmasher
[ $CARCH == "i686" ] && _arch=x86 || _arch=x86_64

prepare() {
    echo -e "#!/usr/bin/sh\n" \
            "export MONO_WINFORMS_XIM_STYLE=disabled\n" \
            "cd /opt/$_installname/game\n" \
            "./AtomZombieSmasher.bin.$_arch" '"$@"' \
        > "launcher.sh"
    mv $_installname/readme.html .
}

package() {
    # Game data
    install -g games -d $pkgdir/opt/$_installname
    cp -rT $_installname "$pkgdir"/opt/$_installname
    
    # Readme
    install -D readme.html \
               "$pkgdir"/usr/share/doc/$_installname/readme.html
    
    # Desktop entry
    install -D $_installname.desktop \
               "$pkgdir"/usr/share/applications/$_installname.desktop
    install -D atom-zombie-smashertCCn9V.png \
               "$pkgdir"/usr/share/pixmaps/$_installname.png

    # Launcher
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/$_installname
}
