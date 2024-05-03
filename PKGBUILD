# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=battle-isle-gog
pkgver=1.0
pkgrel=4
pkgdesc="A turn-based tactics game which tells the story about the wars on the fictional planet, Chromos."
url="https://www.gog.com/game/battle_isle_platinum"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_battle_isle_${pkgver}_(28043).exe"::"gogdownloader://battle_isle/installer_win_en"
        "battle-isle-gog.desktop"
        "battle-isle-gog.sh"
        "dosboxbi1_main.conf"
        "dosboxbi1_desert.conf"
        "dosboxbi1_moon.conf"
        "dosbox_windowed.conf"
        "fix-permissions.sh")

sha256sums=('2fd4aab428ef7b676166b1661f14f65d4c98f4e9de8f18c17208ed5c42b8764d'
            '4b8d7b31fafefed19524cfd0fdf8a4f5a2761b1f173d6174859beab4e158003e'
            'a95521ea627b5a0ab6a61e72a6bdcc7a4806181dc930be9d4a574eee4e146f51'
            '2d558ff949d959525a568089d08595b673cc5241bfa1ae130a423ce3b1b6ca36'
            'a6cf2153a01f11ff2de01210db2739d36d4e6a4f93841b227df1d023ed953382'
            '7145cbfea303b682e415cfe020da23021ac5b04693a17fff74352c59556d40b1'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '7e54dbe4aa0c5050afb7459e0faa1e3cf5c8a3c6747cca834d3acd00941add54')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_battle_isle_${pkgver}_(28043).exe"
    # convert icon
    icotool -x setup/goggame-1207660993.ico
    # create launchers
    sed "s|Exec=battle-isle|& --desert|;s|Name=Battle Isle|&: The Desert|" \
            $pkgname.desktop > battle-isle-desert.desktop
    sed "s|Exec=battle-isle|& --moon|;s|Name=Battle Isle|&: The Moon of Chromos|" \
            $pkgname.desktop > battle-isle-moon.desktop

    cp setup/__support/app/dosboxbi1.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,*.ico,*.dll,goggame-1207660993.*,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/battle-isle
    cp -r setup/* "$pkgdir"/opt/battle-isle
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/battle-isle
    # additional dosbox configs
    install -m644 *.conf "$pkgdir"/opt/battle-isle
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    for _f in app/*.pdf; do
        ln -s -t "$pkgdir"/usr/share/doc/$pkgname "/opt/battle-isle/$(basename "$_f")"
    done
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/battle-isle.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/battle-isle
    for _m in desert moon; do
        install -m644 battle-isle-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207660993_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/battle-isle.png
}
