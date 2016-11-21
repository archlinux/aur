# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=historyline-1914-1918-gog
pkgver=2.2.0.20
pkgrel=1
pkgdesc="A turn-based tactics game which takes the player through various battles of the First World War."
url="https://www.gog.com/game/battle_isle_platinum"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_battle_isle_historyline_$pkgver.exe"::"gogdownloader://historyline_19141918/installer_win_en"
        "historyline-1914-1918-gog.desktop"
        "historyline-1914-1918-gog.sh"
        "dosbox_windowed.conf"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('bd2083c0e6ffc51ef214ce2b8bc3903751db575215ecb3354a6251b766e62891'
            '3e23da721bf92236f431cb6d1131ae2d0681afc162baa027167816d164c9567b'
            '96426337f51658c94be5ad91a21fefcec936d73e35d66a27e79ef69e93ddc428'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            '9e8cfbbba458f19373df1c32c69cbc91c5c49d25d9cd0585b19839b9844ed3d3'
            '8cb0a355c97b243e495509fd63191ba93b8e2e89fc45bf636938f691580102d0')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_battle_isle_historyline_$pkgver.exe
    # convert icon
    icotool -x app/goggame-1207661063.ico
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,goggame-1207661063.*,*.zip,__support}
    # fix mount directory
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/historyline-1914-1918
    cp -r app/* "$pkgdir"/opt/historyline-1914-1918
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/historyline-1914-1918
    # additional dosbox configs
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/historyline-1914-1918
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/historyline-1914-1918/manual.pdf
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/historyline-1914-1918.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/historyline-1914-1918
    # icon
    install -Dm644 goggame-1207661063_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/historyline-1914-1918.png
}
