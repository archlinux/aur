# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=historyline-1914-1918-gog
pkgver=1.0
pkgrel=3
pkgdesc="A turn-based tactics game which takes the player through various battles of the First World War."
url="https://www.gog.com/game/battle_isle_platinum"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_battle_isle_historyline_1914-1918_${pkgver}_(28043).exe"::"gogdownloader://historyline_19141918/installer_win_en"
        "historyline-1914-1918-gog.desktop"
        "historyline-1914-1918-gog.sh"
        "dosboxbi1hl_single.conf"
        "dosbox_windowed.conf"
        "fix-permissions.sh")

sha256sums=('8b66992e3c9b80853a2df4bb7d0bd74d043bd475aedb4e23b701ea21ff4d0291'
            '3e23da721bf92236f431cb6d1131ae2d0681afc162baa027167816d164c9567b'
            '1cf2f67556ca4ba5396588c5d4eaf1b22776e4e3a32908e3472cb4c342927577'
            '6b82ae24bc2815299b7bc894f6186589779c9f9dd3b3bba7340268d502d098e7'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '8cb0a355c97b243e495509fd63191ba93b8e2e89fc45bf636938f691580102d0')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_battle_isle_historyline_1914-1918_${pkgver}_(28043).exe"
    # convert icon
    icotool -x setup/goggame-1207661063.ico

    cp setup/__support/app/dosboxbi1hl.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,*.ico,*.dll,goggame-1207661063.*,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/historyline-1914-1918
    cp -r setup/* "$pkgdir"/opt/historyline-1914-1918
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/historyline-1914-1918
    # additional dosbox configs
    install -m644 *.conf "$pkgdir"/opt/historyline-1914-1918
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/historyline-1914-1918/manual.pdf
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/historyline-1914-1918.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/historyline-1914-1918
    # icon
    install -Dm644 goggame-1207661063_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/historyline-1914-1918.png
}
