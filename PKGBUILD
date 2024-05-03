# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=jagged-alliance-deadly-games-gog
pkgver=1.13
pkgrel=3
pkgdesc="A turn-based tactics game developed as a sequel of Jagged Alliance and features new missions and a multiplayer mode."
url="https://www.gog.com/game/jagged_alliance_deadly_games"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_jagged_alliance_-_deadly_games_${pkgver}_(28044).exe"::"gogdownloader://jagged_alliance_deadly_games/installer_win_en"
        "jagged-alliance-deadly-games-gog.sh"
        "jagged-alliance-deadly-games-gog.desktop"
        "dosboxjadg_single.conf"
        "dosboxjadg_client.conf"
        "dosboxjadg_server.conf"
        "dosboxjadg_settings.conf"
        "dosbox_windowed.conf"
        "dosbox_ipx.conf"
        "fix-permissions.sh")

sha256sums=('9a0ea3c3eaacefdfe8a85e3fb29e6e5377e0d667143a4ca68ca8fea9b1d946f7'
            '6c737cd1d3ecab4b4e2e631c6cea2025e77ea0d96b73c95af400826ec6561c2f'
            'a036530c481cb7763ed778366d046636ca1695f8da1d518e98a72a4f86b4dc14'
            '39bc6cb3a8dedb823bc2a789984d74773fcf684dff1a82b839007a4aac3d8926'
            'c7cfa75590d3845f7c8fc05098e34f4a5a7183a755199dfbeb9c695aeef63ec1'
            'd9bf5991403007f2c5bfe008b10cf5895c43558c4f4ed442b0c7caa638c1540a'
            '5e38bfa13dc57bc8c6bc9ff28f7b2268ea043f918dc247aba89daad29e78f665'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'e90b33464517fb8b8102f3667755302e01fa10b7bec3d660357f802685416ca8'
            '5bd5ad321e40676448871190cfe55294279c3bf0703e71e97a28c138ebe44937')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_jagged_alliance_-_deadly_games_${pkgver}_(28044).exe"
    # convert icon
    icotool -x setup/goggame-1207658690.ico
    # create launchers
    for _m in client server settings; do
        sed "s|Exec=jagged-alliance-deadly-games|& --$_m|;s|Name=Jagged Alliance: Deadly Games|& (${_m^})|" \
                    $pkgname.desktop > jagged-alliance-deadly-games-$_m.desktop
    done

    cp setup/__support/app/dosboxjadg.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,goggame-1207658690.*,*.dll,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/jagged-alliance-deadly-games
    cp -r setup/* "$pkgdir"/opt/jagged-alliance-deadly-games
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/jagged-alliance-deadly-games
    # additional dosbox config
    install -m644 *.conf "$pkgdir"/opt/jagged-alliance-deadly-games
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/jagged-alliance-deadly-games/{dg113.txt,readme.txt}
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/jagged-alliance-deadly-games.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/jagged-alliance-deadly-games
    for _m in client server settings; do
        install -m644 jagged-alliance-deadly-games-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207658690_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/jagged-alliance-deadly-games.png
}
