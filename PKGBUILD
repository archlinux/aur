# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=jagged-alliance-gog
pkgver=2.0.0.2
pkgrel=1
pkgdesc="A turn-based tactics game that takes place on the fictional South Atlantic island of Metavira."
url="https://www.gog.com/game/jagged_alliance"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_jagged_alliance_$pkgver.exe"::"gogdownloader://jagged_alliance/installer_win_en"
        "jagged-alliance-gog.sh"
        "jagged-alliance-gog.desktop"
        "dosbox_windowed.conf"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('c4800b3a93b1a83f77f69824fc9fa2c8e800b6d3657e959b6f1fb6347a688988'
            '0859a50cc4aaa025bbb4211f3b80ea11e997f6da12408c23c9a3f7b1cc9af03c'
            'ea3f11dce620e6f1f9c2d6712c9168fe3216e6df5751f01f2ead022e1e746874'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'f799b02666773c286c96c9bd6583540dc17f78e263ed54efbfbbe8bec7ab7ea7'
            '68233aebc7a7ba578fda0ab0744ecfa9a3d5964c27e81c1d080a9f522cf78a89')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_jagged_alliance_$pkgver.exe
    # convert icon
    icotool -x app/gfw_high.ico
    # create launchers
    for _m in settings; do
        sed "s|Exec=jagged-alliance|& --$_m|;s|Name=Jagged Alliance|& (${_m^})|" \
                    $pkgname.desktop > jagged-alliance-$_m.desktop
    done
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,*.zip,__support}
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/jagged-alliance
    cp -r app/* "$pkgdir"/opt/jagged-alliance
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/jagged-alliance
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/jagged-alliance
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/jagged-alliance/{manual.pdf,quickrefcard.pdf}
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/jagged-alliance.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/jagged-alliance
    for _m in settings; do
        install -m644 jagged-alliance-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 gfw_high_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/jagged-alliance.png
}
