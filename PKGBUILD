# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=fantasy-general-gog
pkgver=2.0.0.3
pkgrel=1
pkgdesc="A turn-based strategy game set in a high fantasy world."
url="https://www.gog.com/game/fantasy_general"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_fantasy_general_$pkgver.exe"::"gogdownloader://fantasy_general/installer_win_en"
        "fantasy-general-gog.desktop"
        "fantasy-general-gog.sh"
        "dosbox_windowed.conf"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('8edd78a1ad6d8e0c0a5e2aae387a2945c6d0e85aa500acf6c41a32ec2a801484'
            'dccc8dd876353e3486db07bbed80e69a7e620374edc5de2dd7c9d91819a0ef03'
            '636702307a43418d549aa5d27d0890927858b8977a3ff73fe823b4f423cca545'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '0afb0c1b03c813489025533723f360649d112d771f74034a4bc4ef2866116f63'
            'ed21a4119450a6648369826e1da44712e92bd629c77726e021dfd7f19515f146')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_fantasy_general_$pkgver.exe
    # convert icon
    icotool -x app/goggame-1430136345.ico
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,goggame-1430136345.*,*.zip,__support}
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/fantasy-general
    cp -r app/* "$pkgdir"/opt/fantasy-general
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/fantasy-general
    # additional dosbox configs
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/fantasy-general
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    for _f in app/*.pdf; do
        ln -s -t "$pkgdir"/usr/share/doc/$pkgname "/opt/fantasy-general/$(basename "$_f")"
    done
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/fantasy-general.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/fantasy-general
    # icon
    install -Dm644 goggame-1430136345_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/fantasy-general.png
}
