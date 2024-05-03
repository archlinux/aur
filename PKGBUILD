# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=constructor-gog
pkgver=1.0_cs
pkgrel=3
pkgdesc="Control a construction company, and aim to drive the other players out of business."
url="https://www.gog.com/game/constructor"
license=('custom:eula')
groups=('eula')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_constructor_${pkgver}_(28162).exe"::"gogdownloader://constructor/installer_win_en"
        "constructor-gog.sh"
        "constructor-gog.desktop"
        "dosboxconstructor_single.conf"
        "dosboxconstructor_client.conf"
        "dosboxconstructor_server.conf"
        "dosboxconstructor_settings.conf"
        "dosbox_windowed.conf"
        "dosbox_ipx.conf"
        "fix-permissions.sh")

sha256sums=('35fcb4970635309697812a6ca9195194ed2e6d0ffa0f70669cb10b6d2845e835'
            '34d7224ec640ff37dc26d894eb56a6a3f9cf83908347e7325d231a2f2fad065f'
            '7db33dbe4048286cc08f76de61c2a81eb9d06f0c8c76d532c5e8c50a7952789f'
            'd793964f2d407ddf43f233b72d41571655296c8501123f07ed986e00e6a8d19e'
            'c7cfa75590d3845f7c8fc05098e34f4a5a7183a755199dfbeb9c695aeef63ec1'
            '04821c3c843b33415aab80df7b8a8770baf906d76edd8d7024384c639a783a63'
            '10c0cbc0ac85fd9071c237a2d5af82a74cda6440e45cad219f469764208c3ed2'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'e90b33464517fb8b8102f3667755302e01fa10b7bec3d660357f802685416ca8'
            'ee6715c4ba84e97ee3d04a4ad00ec1b67439ee8eb4ca2f1fd1000cb47b3f1c92')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir"/setup "setup_constructor_${pkgver}_(28162).exe"
    # convert icon
    icotool -x setup/goggame-1207658826.ico
    # create launchers
    for _m in client server; do
        sed "s|Exec=constructor|& --$_m|;s|Name=Constructor|& (${_m^})|" \
                    $pkgname.desktop > constructor-$_m.desktop
    done

    cp setup/__support/app/dosboxconstructor.conf "$srcdir"
    cp setup/tmp/eula.txt "$srcdir"

    # remove bundled dosbox, windows stuff and gog client files
    rm -rf setup/{app,commonappdata,dosbox,tmp,goggame-*,*.dll,*.zip,__redist,__support}
}

package() {
    # data
    install -d "$pkgdir"/opt/constructor
    cp -r setup/* "$pkgdir"/opt/constructor
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/constructor
    # additional dosbox config
    install -m644 *.conf "$pkgdir"/opt/constructor
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/constructor/manual.pdf
    install -m644 eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/constructor.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/constructor
    for _m in client server; do
        install -m644 constructor-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207658826_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/constructor.png
}
