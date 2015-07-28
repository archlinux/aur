# Maintainer: Sam S <smls75@gmail.com>
# Contributor: Daniel Wallace < danielwallace at gtmanfred dot com>

pkgname=bastion
pkgver=1.2+h20120621
_hibver=2012-06-20
pkgrel=1
pkgdesc="An action role-playing game set in a lush imaginative world (Humble Bundle/Store version)"
url="http://www.supergiantgames.com/games/bastion/"
license=('custom')
arch=('i686' 'x86_64')
groups=("hib5" "hib9")
depends=('sdl' 'mono' 'fmodex' 'libxft')
PKGEXT=".pkg.tar"

_gamepkg="Bastion-HIB-${_hibver}.sh"
_installname=bastion

source=("hib://$_gamepkg"
        "$_installname.desktop")
md5sums=('aa6ccaead3b4b8a5fbd156f4019e8c8b'
         'ff287fa599220f913e8a1ba7b062037e')

case $CARCH in
    i686) _arch=x86 ;;
    x86_64) _arch=x86_64 ;;
esac

prepare() {
    msg2 "Extracting game data..."
    rm -rf data; mkdir -p data/game
    while read line; do echo -n '.'; done < <(  # show progress as dots
        sh $_gamepkg --tar xvf -C data
        bsdtar -xvf data/instarchive_all          -C data/game 2>&1
        bsdtar -xvf data/instarchive_linux_$_arch -C data/game 2>&1
    ); echo
    
    msg2 "Preparing launch script..."
    echo -e "#!/usr/bin/env bash\n" \
            "cd /opt/$_installname\n" \
            "export force_s3tc_enable=true\n" \
            'exec mono Bastion.exe "$@"' \
        > launcher.sh
    
    # Set apart files to install separately
    mv data/game/{Bastion.png,README.linux} "$srcdir"
}

package() {
    _target="$pkgdir"/opt/$_installname
    
    # Install game data
    install -d "$_target"
    cp -alrT data/game "$_target"
    
    # Remove unneeded files
    rm -r "$_target"/lib64/{libSDL*,libfmodex.so,libmono*}
    rm -r "$_target"/{mono,Bastion.bin.*}
    rm -r "$_target"/{mscorlib,Mono.*,System*}.dll
    
    # Install launch script
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/$_installname
    
    # Install desktop file & icon
    install -Dm644 $_installname.desktop \
                   "$pkgdir"/usr/share/applications/$_installname.desktop
    install -Dm644 Bastion.png \
                   "$pkgdir"/usr/share/icons/$_installname.png
    
    # Install docs
    install -Dm644 README.linux \
                   "$pkgdir"/usr/share/doc/$_installname/README.linux
}
