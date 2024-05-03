# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=jagged-alliance-gog
pkgver=1.13
pkgrel=4
pkgdesc="A turn-based tactics game that takes place on the fictional South Atlantic island of Metavira."
url="https://www.gog.com/game/jagged_alliance"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_jagged_alliance_${pkgver}_(28044).exe"::"gogdownloader://jagged_alliance/installer_win_en"
        "jagged-alliance-gog.sh"
        "jagged-alliance-gog.desktop"
        "dosboxja_single.conf"
        "dosboxja_settings.conf"
        "dosbox_windowed.conf"
        "fix-permissions.sh")

sha256sums=('03b2652cc2352fd84e98344e019503aa33ef7eb8a884112a5c219f07c6366aa6'
            '1e60766a62965cb1fa816f221f597afa4070949e3440f5152374a63cb7bbf1ff'
            'ea3f11dce620e6f1f9c2d6712c9168fe3216e6df5751f01f2ead022e1e746874'
            'd6ba58df35379ce0662f73ecdf0e5b45b28950b1584f55c2dcfa675a4c432389'
            'aaa680209f8f979e8250983c621268a30bfac3ca551f4dee50e88704bffb8059'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '68233aebc7a7ba578fda0ab0744ecfa9a3d5964c27e81c1d080a9f522cf78a89')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_jagged_alliance_${pkgver}_(28044).exe"
    # convert icon
    icotool -x setup/app/goggame-1207658689.ico
    # create launchers
    for _m in settings; do
        sed "s|Exec=jagged-alliance|& --$_m|;s|Name=Jagged Alliance|& (${_m^})|" \
                    $pkgname.desktop > jagged-alliance-$_m.desktop
    done

    cp setup/__support/app/dosboxja.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app/,commonappdata/,dosbox/,tmp/,goggame-*,*.ico,*.dll,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/jagged-alliance
    cp -r "$srcdir"/setup/* "$pkgdir"/opt/jagged-alliance
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/jagged-alliance
    # dosbox config
    install -m644 dosboxja.conf "$pkgdir"/opt/jagged-alliance
    install -m644 dosboxja_single.conf "$pkgdir"/opt/jagged-alliance
    install -m644 dosboxja_settings.conf "$pkgdir"/opt/jagged-alliance
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/jagged-alliance
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/jagged-alliance/{manual.pdf,quickrefcard.pdf}
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/jagged-alliance.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/jagged-alliance
    for _m in settings; do
        install -m644 jagged-alliance-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207658689_7_256x256x32.png "$pkgdir"/usr/share/pixmaps/jagged-alliance.png
}
