# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=battle-isle2-gog
pkgver=2.2.0.20
pkgrel=1
pkgdesc="A turn-based tactics game which tells the story about the wars on the fictional planet, Chromos."
url="https://www.gog.com/game/battle_isle_platinum"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_battle_isle2_$pkgver.exe"::"gogdownloader://battle_isle2/installer_win_en"
        "battle-isle2-gog.sh"
        "battle-isle2-gog.desktop"
        "dosboxbi2_main.conf"
        "dosboxbi2_addon.conf"
        "dosbox_windowed.conf"
        "fix-image-cue.patch"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('8376ed695366a5495c216ca0ebf7153138318fa2ebff1c78a272b32b89dcbe6f'
            'e59720ae6e516c7d78c1174d827ab90e49f084bff5c00204b6d717b1de2ab8cc'
            'bb5c13954638d030c740805153aa25db3f94b21e0acef895022f1967d796fed4'
            '0331176b6b3e5505cb81e805cd90a3130bd861403b300b46ca7445aab4b2ca1a'
            '9407e1f77e8ccf1ed20504c42ce13560938e0d5b2412ae249d578a96acad8719'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'c2164249e7e5968ad356001599f6301c5652bd8d4bed42d36f317ca92b4b2612'
            '1c1917bccab3e7ba21b4a518634122715809a62a9b09cf8a72c9a794db3f02fb'
            'f85afa50c4adaf6c9c160da79b6ad77eadf334813f7bdb90eccbaf25bf85d54f')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_battle_isle2_$pkgver.exe
    # convert icon
    icotool -x app/goggame-1207661073.ico
    # create launchers
    sed "s|Exec=battle-isle2|& --addon|;s|Name=Battle Isle 2|&: Titan's Legacy|" \
            $pkgname.desktop > battle-isle2-addon.desktop
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,goggame-1207661073.*,*.zip,__support}
    # fix image cue
    patch -p1 -i "$srcdir"/fix-image-cue.patch
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/battle-isle2
    cp -r app/* "$pkgdir"/opt/battle-isle2
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/battle-isle2
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/battle-isle2
    install -m644 dosboxbi2_main.conf "$pkgdir"/opt/battle-isle2
    install -m644 dosboxbi2_addon.conf "$pkgdir"/opt/battle-isle2
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/battle-isle2/{manual.pdf,scenery\ -\ manual.pdf}
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/battle-isle2.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/battle-isle2
    install -m644 battle-isle2-addon.desktop "$pkgdir"/usr/share/applications
    # icon
    install -Dm644 goggame-1207661073_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/battle-isle2.png
}
