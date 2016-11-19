# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=syndicate-plus-gog
pkgver=2.1.0.15
pkgrel=1
pkgdesc="In the dark and twisted cities of tomorrow, corporate syndicates compete for global dominance."
url="https://www.gog.com/game/syndicate"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_syndicate_plus_$pkgver.exe"::"gogdownloader://syndicate/installer_win_en"
        "syndicate-plus-gog.desktop"
        "syndicate-plus-gog.sh"
        "dosbox_windowed.conf"
        "dosbox_ipx.conf"
        "dosboxsyndicate_main.conf"
        "dosboxsyndicate_addon.conf"
        "dosboxsyndicate_reset.conf"
        "simple-net-config.patch"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('671c5197f1a1dbe7fb3118a5f0c5595bb9d65693e1856f656eb4f572c99e1af0'
            '9972dfcceb58af7fa0ca258a1c8ecdffbd15fb817dc75f137afa9bc6bfae0256'
            '78f956a693b56907632d701e777117f84abb4675fe4d4e8413e8618151f4e6e9'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'e90b33464517fb8b8102f3667755302e01fa10b7bec3d660357f802685416ca8'
            '693a4d7a323acc98ad2ff585b9f403b937367e9a7ed8f7b1993a98889422a5a8'
            'a04b70aac6c4190883027db4d8b0bb6ba6222fa75a59e529cecd41f3f6818937'
            'fd169eb8188428b6cdcce088604439e81f47e5412b122a0b51f88a0d4bd86e1b'
            'aff618cf2fc395598cf12c64ef180a79679c2d79f1ff9e707f19aa384b2beb74'
            '33aa6befd7e18dd8d6c84db09879a5414d78e7554940dd31ae58e9bd22e293a0'
            '27da071a9e01ea0952c92dcdcd5c8100dc60a5694bd9d183dee79f9d3a10da2a')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_syndicate_plus_$pkgver.exe
    # convert icon
    icotool -x app/goggame-1207658992.ico
    # create launchers
    sed "s|Exec=syndicate|& --addon|;s|Name=Syndicate|&: American Revolt|" \
            $pkgname.desktop > syndicate-american-revolt.desktop
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,goggame-1207658992.*,*.zip,__support}
    # simplified net config for start script
    patch -p1 -i "$srcdir"/simple-net-config.patch
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/syndicate-plus
    cp -r app/* "$pkgdir"/opt/syndicate-plus
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/syndicate-plus
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/syndicate-plus
    install -m644 dosbox_ipx.conf "$pkgdir"/opt/syndicate-plus
    install -m644 dosboxsyndicate_main.conf "$pkgdir"/opt/syndicate-plus
    install -m644 dosboxsyndicate_addon.conf "$pkgdir"/opt/syndicate-plus
    install -m644 dosboxsyndicate_reset.conf "$pkgdir"/opt/syndicate-plus
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/syndicate-plus/manual.pdf
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/syndicate.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/syndicate
    install -m644 syndicate-american-revolt.desktop "$pkgdir"/usr/share/applications
    # icon
    install -Dm644 goggame-1207658992_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/syndicate.png
}
