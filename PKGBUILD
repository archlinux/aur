# Maintainer: Constantin Nickel <constantin dot nickel at gmail dot com>

pkgname=simcity-2000-gog
pkgver=2.0.0.15
pkgrel=1
pkgdesc="Now you can design any city you can imagine and SimCity 2000 will bring it, and its resident Sims, to life."
url="https://www.gog.com/game/simcity_2000_special_edition"
license=('custom:eula')
groups=('games')
arch=('any')
makedepends=('innoextract' 'icoutils')
depends=('dosbox')
optdepends=('unionfs-fuse: mounting game folder to home for savegames and settings')
install=$pkgname.install

source=("setup_sc2000_se_$pkgver.exe"::"gogdownloader://simcity_2000_special_edition/installer_win_en"
        "simcity-2000-gog.desktop"
        "simcity-2000-gog.sh"
        "dosbox_windowed.conf"
        "fix-dosbox-output.patch"
        "fix-dosbox-mounts.patch"
        "fix-permissions.sh")

sha256sums=('ae31e0600be24e23d0605ad5c8b002d7b4770a52e6e7f3b9e164c57edaa2740c'
            '471482788dbfe607758a13e338241c39f8e8af1efa37d8d4f17310ded2374707'
            '87aaf64369ff565df3ff5f72fdfc4a3ca4209cfa0ba21d7d9ed0d43e7bce0d4c'
            '50b601b33522677a9bcaf23edc833329067bb87ccda33039c0b95f0d4ddca578'
            'f9e3d53e0d1098fef7ffbc488158ac32a5b2a4e9ff97fa0e54c99b14c24a1a59'
            '21f2ef32bb3c766329954dd7438a33c1afe48bd09a2d5644270240c415b1dca7'
            '29dbb68855c778d664f603bca889f7b156acaeed7a39f50bf35a60f13d6d0e12')

# You need to download the gog.com installer file to this directory ($PWD),
# either manually or with lgogdownloader. You can also configure DLAGENTS in
# makepkg.conf to auto-download.
#
# The following is just a fallback to the above to notify the user:
DLAGENTS+=('gogdownloader::/usr/bin/awk BEGIN{print"Please\ download\ the\ file\ \\""\ substr("%o",1,length("%o")-5)\ "\\"\ manually\\nor\ setup\ a\ gogdownloader://\ DLAGENT\ in\ makepkg.conf!\ Read\ this\ PKGBUILD\ for\ more\ information.";exit\ 1}')

prepare() {
    # extract installer (convert files to lowercase, as DOS does not care)
    innoextract -e -L -d "$srcdir" setup_sc2000_se_$pkgver.exe
    # convert icon
    icotool -x app/gfw_high.ico
    # create launchers
    for _m in scurk settings; do
        sed "s|Exec=simcity-2000|& --$_m|;s|Name=Simcity 2000|& (${_m^})|" \
                    $pkgname.desktop > simcity-2000-$_m.desktop
    done
    # remove bundled dosbox, windows stuff and gog client files
    rm -rf app/{dosbox/,*.ico,*.dll,*.zip,__support}
    # fix dosbox output
    patch -p1 -i "$srcdir"/fix-dosbox-output.patch
    # fix dosbox mounts
    patch -p1 -i "$srcdir"/fix-dosbox-mounts.patch
}

package() {
    # data
    install -d "$pkgdir"/opt/simcity-2000
    cp -r app/* "$pkgdir"/opt/simcity-2000
    # fix permissions script
    install -Dm755 fix-permissions.sh "$pkgdir"/opt/simcity-2000
    # additional dosbox config
    install -m644 dosbox_windowed.conf "$pkgdir"/opt/simcity-2000
    # doc + licenses
    install -d "$pkgdir"/usr/share/{doc,licenses}/$pkgname
    ln -s -t "$pkgdir"/usr/share/doc/$pkgname /opt/simcity-2000/{manual.pdf,readme.txt}
    install -m644 tmp/{gog_,}eula.txt "$pkgdir"/usr/share/licenses/$pkgname
    # .desktop files and launchers
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/simcity-2000.desktop
    install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/simcity-2000
    for _m in scurk settings; do
        install -m644 simcity-2000-$_m.desktop "$pkgdir"/usr/share/applications
    done
    # icon
    install -Dm644 gfw_high_6_256x256x32.png "$pkgdir"/usr/share/pixmaps/simcity-2000.png
}
