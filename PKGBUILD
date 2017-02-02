# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=constructor-gog
pkgver=2.1.0.11
pkgrel=1
pkgdesc="Control a construction company, and aim to drive the other players out of business."
url="https://www.gog.com/game/constructor"
license=('custom:eula')
groups=('eula')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_constructor_$pkgver.exe"::"gogdownloader://constructor/installer_win_en"
        "constructor-gog.sh"
        "constructor-gog.desktop"
        "dosbox_windowed.conf"
        "dosbox_ipx.conf"
        "simple-net-config.patch"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('49ac172a3f82671eb89ea9d858f8b2643f820c394446eb1a88564b293a88acfd'
            'bce1e648feb9e15bcbc33f7dec9a290a01c224a083801d258d9db36f4314c92b'
            '7db33dbe4048286cc08f76de61c2a81eb9d06f0c8c76d532c5e8c50a7952789f'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'e90b33464517fb8b8102f3667755302e01fa10b7bec3d660357f802685416ca8'
            '7168e67bd3b7308993f12f36c45571681e91c3d51be0561ede0cda9c889a993c'
            '5eff85a14fa02aca36c0d7bbab89c6993ed2b7b81c23807d0f79d724d6d583db'
            'ee6715c4ba84e97ee3d04a4ad00ec1b67439ee8eb4ca2f1fd1000cb47b3f1c92')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_constructor_$pkgver.exe
    # convert icon
    icotool -x app/goggame-1207658826.ico
    # create launchers
    for _m in client server; do
        sed "s|Exec=constructor|& --$_m|;s|Name=Constructor|& (${_m^})|" \
                    $pkgname.desktop > constructor-$_m.desktop
    done
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,*.zip,__support}
    # simplified net config for start script
    patch -p1 -i "$srcdir"/simple-net-config.patch
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/constructor
    cp -r app/* "$pkgdir"/opt/constructor
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/constructor
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/constructor
    install -m644 dosbox_ipx.conf "$pkgdir"/opt/constructor
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/constructor/manual.pdf
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/constructor.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/constructor
    for _m in client server; do
        install -m644 constructor-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 goggame-1207658826_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/constructor.png
}
