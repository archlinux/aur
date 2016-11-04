# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com>

pkgname=bastion-hib
_installname=bastion
pkgver=1.2+h20161016
_hibver=10162016
pkgrel=1
pkgdesc="An action role-playing game set in a lush imaginative world (Humble Bundle/Store version)"
url="http://www.supergiantgames.com/games/bastion/"
license=('custom')
arch=('i686' 'x86_64')
groups=("hib5" "hib9")
depends=('sdl' 'mono' 'fmodex' 'libxft')
makedepends=('imagemagick')
optdepends=('xdg-utils: For the website links in the menu')
conflicts=('bastion')
replaces=('bastion')
options=('!strip')
PKGEXT=".pkg.tar"

_gamepkg="bastion-${_hibver}-bin"

source=("hib://$_gamepkg"
        "$_installname.desktop")
md5sums=('19fea173ff2da0f990f60bd5e7c3b237'
         'ff287fa599220f913e8a1ba7b062037e')

case $CARCH in
    i686)   _arch=x86    ; _lib=lib   ; _lib_other=lib64 ;;
    x86_64) _arch=x86_64 ; _lib=lib64 ; _lib_other=lib   ;;
esac

prepare() {
    # Set apart files to install separately
    mv data/{Bastion.bmp,Linux.README} .
    
    msg2 "Preparing icon..."
    convert Bastion.bmp Bastion.png
    
    msg2 "Preparing launch script..."
    echo -e "#!/usr/bin/env sh\n" \
            "cd /opt/$_installname\n" \
            "export force_s3tc_enable=true\n" \
            "export LD_LIBRARY_PATH='./$_lib:\$LD_LIBRARY_PATH'\n" \
            'exec mono Bastion.exe "$@"' \
        > launcher.sh
}

package() {
    _target="$pkgdir"/opt/$_installname
    
    # Install game data
    install -d "$_target"
    cp -alrT data "$_target"
    
    # Remove unneeded files
    rm -r "$_target"/$_lib_other
    rm -r "$_target"/$_lib/{libSDL*,libfmodex.so,libmono*}
    rm -r "$_target"/{mono,Bastion,Bastion.bin.*}
    rm -r "$_target"/{mscorlib,Mono.*,System*}.dll
    
    # Install launch script
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/$_installname
    
    # Install desktop file & icon
    install -Dm644 $_installname.desktop \
                   "$pkgdir"/usr/share/applications/$_installname.desktop
    install -Dm644 Bastion.png \
                  "$pkgdir"/usr/share/icons/$_installname.png
    
    # Install docs
    install -Dm644 Linux.README \
                   "$pkgdir"/usr/share/doc/$_installname/Linux.README
}
