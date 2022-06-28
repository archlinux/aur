# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>
# Contributor: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-gog
pkgver=3369
_pkgvermaj=3369
_pkgvermin=2
pkgrel=5
pkgdesc="Unreal Tournament 2004 ECE native Linux version with data via GOG"
arch=('i686' 'x86_64')
url="https://www.gog.com/game/unreal_tournament_2004_ece"
license=('custom')
depends=('sdl' 'openal' 'libstdc++5')
makedepends=('lgogdownloader' 'innoextract')
conflicts=('ut2004' 'ut2004-steam')
source=("setup_unreal_tournament_2004_1.0_(18947).exe::gogdownloader://unreal_tournament_2004_ece/en1installer0"
    "setup_unreal_tournament_2004_1.0_(18947)-1.bin::gogdownloader://unreal_tournament_2004_ece/en1installer1"
    "https://github.com/jm2/archlinux-package-ut2004-steam/raw/master/ut2004-lnxpatch$_pkgvermaj-$_pkgvermin.tar.bz2"
    "ut2004.desktop"
    "ut2004.png"
    "ut2004.sh")
sha256sums=('1f8712b4da90a22d822e4f2c2a4d841df2692be96d0f85f9064c6c77480c3b85'
            '81b6c1cf3931bf030d918461a134eff49921a0809cf215a6066639d0e6f0bf67'
            '438b9b13a367d46f23cce12b065382a55afa2fc68add1f1dd3db03b015f60bb3'
            'daf88b168e941d0bdd6c6637934a98d703f962afec7c64a1502c5b82ff66c6c8'
            '9fd35b406dc32caa6a0700bda89ac72f561346b919c4764d943bf4198ec032fd'
            'bd03cfb6a2006cb8a7786111e156b4a71f31ea1af38fc1329c8364d6082bb952')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
    # Making sure directories exist.
    install -d $pkgdir/usr/share/{applications,pixmaps,licenses}
    install -d $pkgdir/opt/ut2004
    install -d $pkgdir/opt/ut2004/{Animations,Help,Textures,Web,Benchmark,ForceFeedback,KarmaData,Maps,Music,StaticMeshes,Sounds,Speech,System}
    install -d $pkgdir/usr/bin/

    # Install the GOG UT2004 data.
    innoextract "$srcdir/setup_unreal_tournament_2004_1.0_(18947).exe" -d "$pkgdir/opt/ut2004/"

    # Install UT2004 Linux patch data.
    cp -R $srcdir/UT2004-Patch/* $pkgdir/opt/ut2004

    # Install helper scripts.
    install -D -m 755 $srcdir/ut2004.sh \
         $pkgdir/opt/ut2004/Scripts/ut2004

    # Install license.
    install -D -m 644 $srcdir/UT2004-Patch/System/License.int \
         $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Install desktop file.
    install -D -m 644 $srcdir/ut2004.desktop \
             $pkgdir/usr/share/applications/ut2004.desktop

    # Install icon file.
    install -D -m 644 $srcdir/ut2004.png \
             $pkgdir/usr/share/pixmaps/ut2004.png

    # Create symlinks to add the ut2004 startup and utility scripts to usr/bin
    ln -s /opt/ut2004/Scripts/ut2004 $pkgdir/usr/bin/ut2004 || return 1

    if [ "$CARCH" == "x86_64" ]
    then
         sed 's/ut2004-bin/&-linux-amd64/g' $pkgdir/opt/ut2004/Scripts/ut2004 > $pkgdir/opt/ut2004/Scripts/ut2004.TMP

         install -D -m 755 $pkgdir/opt/ut2004/Scripts/ut2004.TMP $pkgdir/opt/ut2004/Scripts/ut2004
    else
        rm $pkgdir/opt/ut2004/System/ucc-bin-linux-amd64
        rm $pkgdir/opt/ut2004/System/ut2004-bin-linux-amd64
    fi

    # Create symbolic links to system libraries in game directory.
    ln -s /usr/lib/libSDL-1.2.so.0 $pkgdir/opt/ut2004/System || return 1
    chmod 644 $pkgdir/opt/ut2004/System/libSDL-1.2.so.0 || return 1
    ln -s /usr/lib/libopenal.so $pkgdir/opt/ut2004/System/openal.so || return 1
    chmod 644 $pkgdir/opt/ut2004/System/openal.so || return 1
}

# vim:set ts=2 sw=2 et:
