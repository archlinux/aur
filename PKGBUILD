# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=simcity-2000-gog
pkgver=1.0se
pkgrel=3
pkgdesc="Now you can design any city you can imagine and SimCity 2000 will bring it, and its resident Sims, to life."
url="https://www.gog.com/game/simcity_2000_special_edition"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_simcity_2000_special_edition_${pkgver}_(28187).exe"::"gogdownloader://simcity_2000_special_edition/installer_win_en"
        "simcity-2000-gog.desktop"
        "simcity-2000-gog.sh"
        "dosboxsc2000_single.conf"
        "dosboxsc2000_scurk.conf"
        "dosboxsc2000_willtv.conf"
        "dosboxsc2000_settings.conf"
        "dosbox_windowed.conf"
        "fix-permissions.sh")

sha256sums=('794b9e2e9eb242f99d4a107c7b474b3069506d9ebb5e438d8531eb9193bafdd2'
            '471482788dbfe607758a13e338241c39f8e8af1efa37d8d4f17310ded2374707'
            'dc7c554a69147359e686f5687ecff89182049600c2f45e26f793d17b95bc64e9'
            '9a0b89a2bf114caea1d90a4c57e6e2b2558764c1bc1d84d915d10d853cef733a'
            '487ddedcc8fe98975250cf2436676d227e87bc582611250beec716865f2846bb'
            'ec412cfaa82a392a68ab64c288495fca35e51b83fa5224ad977f5dbdf4577da4'
            'cacee617487281f6c998924316735f12890780f208916689f955b4aa5fa42949'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '29dbb68855c778d664f603bca889f7b156acaeed7a39f50bf35a60f13d6d0e12')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_simcity_2000_special_edition_${pkgver}_(28187).exe"
    # convert icon
    icotool -x setup/goggame-1207658969.ico
    # create launchers
    for _m in scurk settings; do
        sed "s|Exec=simcity-2000|& --$_m|;s|Name=Simcity 2000|& (${_m^})|" \
                    $pkgname.desktop > simcity-2000-$_m.desktop
    done

    cp setup/__support/app/dosboxsc2000.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app/,commonappdata/,dosbox/,tmp/,goggame-*,*.ico,*.dll,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/simcity-2000
    cp -r setup/* "$pkgdir"/opt/simcity-2000
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/simcity-2000
    # dosbox config
    install -m644 dosboxsc2000*.conf "$pkgdir"/opt/simcity-2000
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/simcity-2000
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/simcity-2000/{manual.pdf,readme.txt}
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/simcity-2000.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/simcity-2000
    for _m in scurk settings; do
        install -m644 simcity-2000-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207658969_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/simcity-2000.png
}
