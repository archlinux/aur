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
depends=('libxft')
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
            "export force_s3tc_enable=true\n" \
            "cd /opt/bastion\n" \
            "./Bastion.bin.$_arch" \
         > launcher.sh
}

package() {
    # Install game data
    install -d "$pkgdir"/opt/bastion
    cp -alrT data/game "$pkgdir"/opt/bastion
    
    # Install desktop file & icon
    install -Dm644 $_installname.desktop \
                   "$pkgdir"/usr/share/applications/$_installname.desktop
    install -Dm644 data/game/Bastion.png \
                   "$pkgdir"/usr/share/icons/$_installname.png
    
    # Install launch script
    install -Dm755 launcher.sh "$pkgdir"/usr/bin/$_installname
}
