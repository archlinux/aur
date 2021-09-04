# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>
# Contributor: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-gog
epoch=1
pkgver=3369_2
_pkgvermaj=3369
_pkgvermin=2
pkgrel=2
pkgdesc="Popular first person shooter, native Linux version, installing data files from GOG (requires you having had purchased the GOG version)."
epoch=1
arch=('i686' 'x86_64')
url="https://www.gog.com/game/unreal_tournament_2004_ece"
license=('custom')
depends=('sdl' 'openal' 'libstdc++5')
makedepends=('lgogdownloader' 'innoextract')
conflicts=('ut2004' 'ut2004-steam')
install=ut2004.install
changelog=ChangeLog
source=("setup_unreal_tournament_2004_1.0_(18947).exe::gogdownloader://unreal_tournament_2004_ece/en1installer0"
    "setup_unreal_tournament_2004_1.0_(18947)-1.bin::gogdownloader://unreal_tournament_2004_ece/en1installer1"
    "https://github.com/jm2/archlinux-package-ut2004-steam/raw/master/ut2004-lnxpatch$_pkgvermaj-$_pkgvermin.tar.bz2"
    "ut2004.desktop"
    "ut2004.png"
    "ut2004.sh")
md5sums=('243376d34413b830324c5879ac2f9cfd'
         'a211e2a6feed7334bb3b7deef6b858b5'
         '0fa447e05fe5a38e0e32adf171be405e'
         'f952ba5de805cb475f487644fe16f99b'
         '145fb11c4e768ecb65396f51ac29e743'
         '85623fe9fecd0678e4f12902c22d7272')

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
