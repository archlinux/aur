# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=fantasy-general-gog
pkgver=1.0
pkgrel=3
pkgdesc="A turn-based strategy game set in a high fantasy world."
url="https://www.gog.com/game/fantasy_general"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

# English
_filename="setup_fantasy_general_${pkgver}_(28044).exe"
_downloader="gogdownloader://fantasy_general/installer_win_en"
_checksum="a6384e64558c32ce2a66b3a1e7a50562d4057cfab9909f519829f50ce06a2fd8"

# French
# _filename="setup_fantasy_general_${pkgver}_(french)_(28044).exe"
# _downloader="gogdownloader://fantasy_general/installer_win_fr"
# _checksum="0dcaac101fb59c0f789584e67c07c9feb80bb42cc132dc4e93d15a44308227ff"

# German
# _filename="setup_fantasy_general_${pkgver}_(german)_(28044).exe"
# _downloader="gogdownloader://fantasy_general/installer_win_de"
# _checksum="26ecd5375d3fa3b241cdfa46befbaa8273a77f41ee1c08341958087a29574d67"

source=("$_filename"::"$_downloader"
        "fantasy-general-gog.desktop"
        "fantasy-general-gog.sh"
        "dosbox_fg_single.conf"
        "dosbox_fg_settings.conf"
        "dosbox_windowed.conf"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('a6384e64558c32ce2a66b3a1e7a50562d4057cfab9909f519829f50ce06a2fd8'
            'dccc8dd876353e3486db07bbed80e69a7e620374edc5de2dd7c9d91819a0ef03'
            '2e440c39796c7420c208e5ad73e5f8b0a749c5c775bc15e69d1ed3227e8338f3'
            'a47c3f6dea5ba58bd993b9a3a0f9d717de97051ea10616686bbdb44cff5d4b27'
            'f72970cd0222f582b69eb6aa877989211813df1ad4bd6775b67983ace5336672'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '0e2b707e32056bb1b33c00e9a16c3ce90943ffe9d30435a2b8aa2ec8db520927'
            'ed21a4119450a6648369826e1da44712e92bd629c77726e021dfd7f19515f146')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "$_filename"
    # convert icon
    icotool -x setup/goggame-1430136345.ico

    cp setup/__support/app/dosbox_fg.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,*.ico,*.dll,goggame-1430136345.*,*.zip,__redist,__support}
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/fantasy-general
    cp -r setup/* "$pkgdir"/opt/fantasy-general
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/fantasy-general
    # additional dosbox configs
    install -m644 *.conf "$pkgdir"/opt/fantasy-general
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    for _f in app/*.pdf; do
        ln -s -t "$pkgdir"/usr/share/doc/$pkgname "/opt/fantasy-general/$(basename "$_f")"
    done
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/fantasy-general.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/fantasy-general
    # icon
    install -Dm644 goggame-1430136345_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/fantasy-general.png
}
