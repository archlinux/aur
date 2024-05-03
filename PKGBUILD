# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=battle-isle2-gog
pkgver=1.0
pkgrel=3
pkgdesc="A turn-based tactics game which tells the story about the wars on the fictional planet, Chromos."
url="https://www.gog.com/game/battle_isle_platinum"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_battle_isle_2_${pkgver}_(28043).exe"::"gogdownloader://battle_isle2/installer_win_en"
        "battle-isle2-gog.sh"
        "battle-isle2-gog.desktop"
        "dosboxbi2_main.conf"
        "dosboxbi2_addon.conf"
        "dosbox_windowed.conf"
        "fix-image-cue.patch"
        "fix-permissions.sh")

sha256sums=('cbb7bef8cbac55e6b29468ad84c956b55be5bf2792e5986544617f5af3af607b'
            '5c0a4bbb146a98f51e6c2de791febaa98350a0b4deaecef613ba05e8f45c6859'
            'bb5c13954638d030c740805153aa25db3f94b21e0acef895022f1967d796fed4'
            '0331176b6b3e5505cb81e805cd90a3130bd861403b300b46ca7445aab4b2ca1a'
            '9407e1f77e8ccf1ed20504c42ce13560938e0d5b2412ae249d578a96acad8719'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '0b4e0e2a45a6277db319d9445bed0ed899f5f54e32e929a6415477d0d1e0af14'
            'f85afa50c4adaf6c9c160da79b6ad77eadf334813f7bdb90eccbaf25bf85d54f')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_battle_isle_2_${pkgver}_(28043).exe"
    # convert icon
    icotool -x setup/goggame-1207661073.ico
    # create launchers
    sed "s|Exec=battle-isle2|& --addon|;s|Name=Battle Isle 2|&: Titan's Legacy|" \
            $pkgname.desktop > battle-isle2-addon.desktop

    cp setup/__support/app/dosboxbi2.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,*.ico,*.dll,goggame-1207661073.*,*.zip,__redist,__support}
    # fix image cue
    patch -p1 -i "$srcdir"/fix-image-cue.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/battle-isle2
    cp -r setup/* "$pkgdir"/opt/battle-isle2
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/battle-isle2
    # additional dosbox config
    install -m644 *.conf "$pkgdir"/opt/battle-isle2
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/battle-isle2/{manual.pdf,scenery\ -\ manual.pdf}
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/battle-isle2.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/battle-isle2
    install -m644 battle-isle2-addon.desktop "$pkgdir"/usr/share/applications
    # icon
    install -Dm644 goggame-1207661073_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/battle-isle2.png
}
