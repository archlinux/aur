# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=dungeon-keeper-gold-gog
pkgver=10.1
pkgrel=5
pkgdesc="Construct and manage a dungeon, recruiting and catering for minions to run it and defend it from enemy invaders."
url="https://www.gog.com/game/dungeon_keeper"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_dungeon_keeper_gold_${pkgver}_(28184).exe"::"gogdownloader://dungeon_keeper/en1installer0"
        "dungeon-keeper-gold-gog.sh"
        "dungeon-keeper-gold-gog.desktop"
        "dosboxdk_single.conf"
        "dosboxdk_addon.conf"
        "dosboxdk_client.conf"
        "dosboxdk_server.conf"
        "dosboxdk_settings.conf"
        "dosbox_windowed.conf"
        "dosbox_ipx.conf"
        "fix-permissions.sh")

sha256sums=('7c108532b5f0549c8c265ffa6ae7744a6d0f785856434b90911fa8276b031004'
            '8ed8aea53a61693c47aa61aae70ecf63eca12a7810357e6a4f95fabbb044c00c'
            'bdbab0f3525b380d81cea61713009251da55a13c222ee4b4117afec12e90d4f9'
            '3f78d7642c634d8e1f55f51ff6cddf0a8cdfd6555beec807f7aa0cf1d7e34383'
            'c50525401410a86ac536f9ab4911d2871694838682e7ddb77de18daad823e6f5'
            '2fdfcf1543d1194bf88fb9064c3a8b3b83769c2d723220d4d637d4a60c1905b7'
            'be5399a17a4769fe7c1fb66b25cef6ed8f0baff82d73233dcfb7d0f3a6c45ef4'
            '74081d05c1a97ad7d54bc085cc3812d54b5edb44768f057918a92523c4fcb350'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'e90b33464517fb8b8102f3667755302e01fa10b7bec3d660357f802685416ca8'
            'bbfa392edd4ac36e2c274d22b07bf2f9115e3f134b0b7c8b146538d2d0b36c2a')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_dungeon_keeper_gold_${pkgver}_(28184).exe"
    # convert icon
    icotool -x setup/goggame-1207658934.ico
    icotool -x setup/gfw_high_addon.ico
    # create launchers
    sed "s/Dungeon Keeper/Deeper Dungeons/;s/dungeon-keeper/deeper-dungeons/" \
            $pkgname.desktop > deeper-dungeons.desktop
    for _m in client server settings; do
        sed "s|Exec=dungeon-keeper|& --$_m|;s|Name=Dungeon Keeper|& (${_m^})|" \
                    $pkgname.desktop > dungeon-keeper-$_m.desktop
    done

    cp setup/__support/app/dosboxdk.conf "$srcdir"
    cp -r setup/__support/save/* "$srcdir"/setup
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,*.ico,*.dll,goggame-1207658934.*,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/dungeon-keeper-gold
    cp -r setup/* "$pkgdir"/opt/dungeon-keeper-gold
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/dungeon-keeper-gold
    # additional dosbox config
    install -m644 *.conf "$pkgdir"/opt/dungeon-keeper-gold
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/dungeon-keeper-gold/manual.pdf
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/dungeon-keeper.desktop
    install -Dm644 deeper-dungeons.desktop "$pkgdir"/usr/share/applications/deeper-dungeons.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/dungeon-keeper
    ln -s dungeon-keeper "$pkgdir"/usr/bin/deeper-dungeons
    for _m in client server settings; do
        install -m644 dungeon-keeper-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207658934_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/dungeon-keeper.png
    install -Dm644 gfw_high_addon_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/deeper-dungeons.png
}
