# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Claudio Kozicky <claudiokozicky@gmail.com>
# Contributor: trya <tryagainprod@gmail.com>
# Contributor: Todd Partridge <toddrpartridge@gmail.com>

pkgname=worldofgoo-gog
_pkgname=worldofgoo
pkgver=1.41_2.0.0.3
_gogver=2.0.0.3
pkgrel=1
pkgdesc="A physics based puzzle/construction game (requires copy of the full game) (GOG version)."
arch=(i686 x86_64)
url="http://2dboy.com/games.php"
license=(custom)
depends=(gtk-update-icon-cache sdl_mixer hicolor-icon-theme)
optdepends=("worldofgoo-gootool: for creating and installing fan levels")
install=$_pkgname.install
source=(local://gog_world_of_goo_${_gogver}.sh
        $_pkgname.desktop)
md5sums=('5359b8e7e9289fba4bcf74cf22856655'
         '706ff492ea8096e1a2a7ee9a4d171aca')
options=(!strip)

prepare()
{
    printf "$(tput bold)$(tput setaf 11):: WARNING ::\\n$(tput sgr0)"
    printf "$(tput bold)$(tput setaf 9)Please use target ${srcdir}/gog and do not create a desktop shortcut or menu item\\n$(tput sgr0)"
    read -e -p "$(tput bold)Press any key to continue... $(tput sgr0)" -n1 -s
    sh ./gog_world_of_goo_${_gogver}.sh

    mv "$srcdir"/gog/game "$srcdir"/WorldOfGoo

    cd "$srcdir"/WorldOfGoo

    # cleanup
    rm -r libs{32,64}
    [ $CARCH = i686 ] \
        && rm WorldOfGoo.bin64 \
        && find -name "*.binltl64" -exec rm {} \; \
        || true
    [ $CARCH = x86_64 ] \
        && rm WorldOfGoo.bin32 \
        && find -name "*.binltl" -exec rm {} \; \
        || true
}

package()
{
    cd "$srcdir"

    # data
    find WorldOfGoo -type f -name "WorldOfGoo*" -exec install -Dm755 {} "$pkgdir"/opt/{} \; \
        -o -type f -exec install -Dm644 {} "$pkgdir"/opt/{} \;

    # launcher
    install -d "$pkgdir"/usr/bin
    ln -s /opt/WorldOfGoo/WorldOfGoo "$pkgdir"/usr/bin/worldofgoo

    # desktop integration
    install -Dm644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
    for i in 16x16 22x22 32x32 48x48 64x64 128x128
    do
        install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps
        ln -s /opt/WorldOfGoo/icons/$i.png "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
    done
    install -d "$pkgdir"/usr/share/icons/hicolor/scalable/apps
    ln -s /opt/WorldOfGoo/icons/scalable.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg

    # doc
    install -d "$pkgdir"/usr/share/doc/$_pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$_pkgname /opt/WorldOfGoo/{linux-issues.txt,readme.html} 

    # legal
    install -d "$pkgdir"/usr/share/licenses/$_pkgname
    ln -s /opt/WorldOfGoo/eula.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

# vim:et:sw=4:sts=4
