# Contributor: Sam S. <smls75@gmail.com> 
# Contributor: trya <tryagainprod@gmail.com>

pkgname=braid-hib
pkgver=1.1+h20150611
_hibver=2015-06-11
pkgrel=2
pkgdesc="A puzzle platformer where you manipulate the flow of time (Humble Bundle/Store version)"
url="http://braid-game.com"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
depends=('xdg-utils')
depends_i686=('sdl2' 'nvidia-cg-toolkit' 'fltk')
depends_x86_64=('lib32-sdl2' 'lib32-nvidia-cg-toolkit' 'lib32-fltk')
optdepends_i686=('libtxc_dxtn: For more efficient texture handling when using one of the open-source Mesa graphics drivers')
optdepends_x86_64=('lib32-libtxc_dxtn: For more efficient texture handling when using one of the open-source Mesa graphics drivers')
options=('!strip')
replaces=('braid')
PKGEXT='.pkg.tar'
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

_gamepkg="BraidSetup-$_hibver.sh"
source=("$_gamepkg::hib://$_gamepkg"
        'braid.desktop')
md5sums=('3650fa470b4794677086e792ddc29aa5'
         'e479ba41d20c1a15a9d8a29fd3b4ff76')

_target=/opt/braid

prepare() {
    # Create launch script
    echo -e '#!/usr/bin/sh\n'\
            "cd $_target\n"\
            'exec ./Braid.bin.x86 "$@"'\
          > "$srcdir"/launcher.sh
}

package() {
    # Install game files
    install -d "$pkgdir"/$_target
    cp -a data/noarch/data "$pkgdir"/$_target
    cp -a data/x86/{Braid.bin.x86,launcher.bin.x86} "$pkgdir"/$_target
    
    # Install docs
    install -d "$pkgdir"/usr/share/doc/braid
    cp -a data/noarch/{README.linux,READ_ME.txt} "$pkgdir"/usr/share/doc/braid
    
    # Install launch script
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/braid
    
    # Install icon & desktop entry
    install -Dm644 data/noarch/Icon.png "$pkgdir"/usr/share/pixmaps/braid.png
    install -Dm644 braid.desktop "$pkgdir"/usr/share/applications/braid.desktop
    
    # Install licenses
    install -d "$pkgdir"/usr/share/licenses/braid
    cp -a data/noarch/licenses/* "$pkgdir"/usr/share/licenses/braid/
}
