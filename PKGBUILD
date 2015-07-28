# Maintainer: Sam S. <smls75@gmail.com>
# Contributor: Malte Wessel <muunleit AT lavabit DOT com>

pkgname=atomzombiesmasher-demo
pkgver=1.94
pkgrel=1
pkgdesc="A 2D tactics/strategy game where you evacuate civilians from zombie-infested cities. (Free demo)"
arch=('any')
url="http://blendogames.com/atomzombiesmasher/"
license=("custom:commercial")
depends=('openal' 'libsndfile' 'mono' 'libgdiplus' 'csfml-bin')
conflicts=("atomzombiesmasher" "atomzombiesmasherdemo" "atomzombiesmasher-hib")
replaces=("atomzombiesmasherdemo")
PKGEXT='.pkg.tar'

source=("http://blendogames.com/files/atomzombiesmasherdemo_v1_84.tar"
        "http://blendogames.com/files/atomzombiepatch_v1_94_linux.tar.gz"
        "atomzombiesmasher.desktop"
        "https://apps.ubuntu.com/site_media/icons/2013/12/atom-zombie-smashertCCn9V.png")
md5sums=('d32e462d158a63997a145d7e82464357'
         'c9512b8c841841967c20a81d36f7a6bc'
         'b1f2e18834d1bec5785a889f642e2191'
         '341ce551a8525be96d6c59c1bf9efd2a')

_gamefolder=atomzombiesmasherdemo/data
_installname=atomzombiesmasher

prepare() {
    msg2 "Patching to version $pkgver..."
    cp -aT data $_gamefolder
    
    msg2 "Preparing launch script..."
    echo -e "#!/usr/bin/sh\n" \
            "cd /opt/$_installname\n" \
            "exec ./atomzombiesmasher \"\$@\"\n" \
        > "launcher.sh"
    sed -i'' 's|./mono|mono|' $_gamefolder/atomzombiesmasher
    
    cd $_gamefolder
    
    msg2 "Fixing permissions..."
    find -type f -exec chmod 644 {} \;
    chmod +x atomzombiesmasher
    
    msg2 "Removing unneeded files..."
    rm -r {mono,libc-2*,libglib*,libcsfml*,libsfml*}
    rm -r {libopenal.so.1,libsndfile.so.1}
    rm -r {Accessibility,Mono.*,mscorlib,System*}.dll
}

package() {
    # Game data
    install -g games -d "$pkgdir"/opt/$_installname
    cp -rT $_gamefolder "$pkgdir"/opt/$_installname
    
    # Readme
    install -Dm644 readme.htm \
                   "$pkgdir"/usr/share/doc/$_installname/readme.html
    
    # Desktop entry
    install -Dm644 $_installname.desktop \
                   "$pkgdir"/usr/share/applications/$_installname.desktop
    install -Dm644 atom-zombie-smashertCCn9V.png \
                   "$pkgdir"/usr/share/pixmaps/$_installname.png
    
    # Launcher
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/$_installname
}
