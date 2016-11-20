# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=battle-isle-gog
pkgver=2.2.0.21
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

source=("setup_battle_isle_$pkgver.exe"::"gogdownloader://battle_isle/installer_win_en"
        "battle-isle-gog.desktop"
        "battle-isle-gog.sh"
        "dosboxbi1_main.conf"
        "dosboxbi1_desert.conf"
        "dosboxbi1_moon.conf"
        "dosbox_windowed.conf"
        "fix-console-output.patch"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('f3886b2700bfa47c8f5d9bb4a888509c3bfc1df688b711a92e12c5a76354e711'
            '4b8d7b31fafefed19524cfd0fdf8a4f5a2761b1f173d6174859beab4e158003e'
            'b6868126d238ab28c8a84f9a2c4591dc204b0aba1f6e7499e46523861b539399'
            '2d558ff949d959525a568089d08595b673cc5241bfa1ae130a423ce3b1b6ca36'
            'a6cf2153a01f11ff2de01210db2739d36d4e6a4f93841b227df1d023ed953382'
            '7145cbfea303b682e415cfe020da23021ac5b04693a17fff74352c59556d40b1'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '1a11e5ecfdd602ce3412633bac3cfc6160a9b6039af407446d98000d34744ef6'
            '557c175620829a0b63d8bd4933ed114d88d6d00f83cda9791332bf1e0e68ed0a'
            '7e54dbe4aa0c5050afb7459e0faa1e3cf5c8a3c6747cca834d3acd00941add54')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_battle_isle_$pkgver.exe
    # convert icon
    icotool -x app/goggame-1207660993.ico
    # create launchers
    sed "s|Exec=battle-isle|& --desert|;s|Name=Battle Isle|&: The Desert|" \
            $pkgname.desktop > battle-isle-desert.desktop
    sed "s|Exec=battle-isle|& --moon|;s|Name=Battle Isle|&: The Moon of Chromos|" \
            $pkgname.desktop > battle-isle-moon.desktop
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,goggame-1207660993.*,*.zip,__support}
    # fix broken console output
    patch -p1 -i "$srcdir"/fix-console-output.patch
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/battle-isle
    cp -r app/* "$pkgdir"/opt/battle-isle
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/battle-isle
    # additional dosbox configs
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/battle-isle
    install -m644 dosboxbi1_main.conf "$pkgdir"/opt/battle-isle
    install -m644 dosboxbi1_desert.conf "$pkgdir"/opt/battle-isle
    install -m644 dosboxbi1_moon.conf "$pkgdir"/opt/battle-isle
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    for _f in app/*.pdf; do
        ln -s -t "$pkgdir"/usr/share/doc/$pkgname "/opt/battle-isle/$(basename "$_f")"
    done
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/battle-isle.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/battle-isle
    for _m in desert moon; do
        install -m644 battle-isle-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207660993_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/battle-isle.png
}
