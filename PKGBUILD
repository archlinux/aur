# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=jagged-alliance-deadly-games-gog
pkgver=2.0.0.2
pkgrel=1
pkgdesc="A turn-based tactics game developed as a sequel of Jagged Alliance and features new missions and a multiplayer mode."
url="https://www.gog.com/game/jagged_alliance_deadly_games"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_ja_dg_$pkgver.exe"::"gogdownloader://jagged_alliance_deadly_games/installer_win_en"
        "jagged-alliance-deadly-games-gog.sh"
        "jagged-alliance-deadly-games-gog.desktop"
        "dosbox_windowed.conf"
        "dosbox_ipx.conf"
        "simple-net-config.patch"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('ba1cbc5f037f4e39b5cc4f89952f3995843cc3c34073eb6207537a286f0dec51'
            'c82f0f84ff1af66da90182e11c3ce39c2b32ff8d8eb52d4a8b98073e52b92a9a'
            'a036530c481cb7763ed778366d046636ca1695f8da1d518e98a72a4f86b4dc14'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'e90b33464517fb8b8102f3667755302e01fa10b7bec3d660357f802685416ca8'
            'fa78eb7a3cf09896d011bcf06ca509661db281151b5c1f54c28713f874fc6880'
            'fd647a02d2d6894e5998d141281b269a6fd51fe0fd60774109f47d5feb7eed18'
            '5bd5ad321e40676448871190cfe55294279c3bf0703e71e97a28c138ebe44937')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_ja_dg_$pkgver.exe
    # convert icon
    icotool -x app/gfw_high.ico
    # create launchers
    for _m in client server settings; do
        sed "s|Exec=jagged-alliance-deadly-games|& --$_m|;s|Name=Jagged Alliance: Deadly Games|& (${_m^})|" \
                    $pkgname.desktop > jagged-alliance-deadly-games-$_m.desktop
    done
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,*.zip,__support}
    # simplified net config for start script
    patch -p1 -i "$srcdir"/simple-net-config.patch
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/jagged-alliance-deadly-games
    cp -r app/* "$pkgdir"/opt/jagged-alliance-deadly-games
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/jagged-alliance-deadly-games
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/jagged-alliance-deadly-games
    install -m644 dosbox_ipx.conf "$pkgdir"/opt/jagged-alliance-deadly-games
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/jagged-alliance-deadly-games/{dg113.txt,readme.txt}
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/jagged-alliance-deadly-games.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/jagged-alliance-deadly-games
    for _m in client server settings; do
        install -m644 jagged-alliance-deadly-games-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 gfw_high_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/jagged-alliance-deadly-games.png
}
