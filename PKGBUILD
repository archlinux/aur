# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>
# Contributor: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-gog
pkgver=3374
_pkgvermaj=3369
_pkgvermin=2
pkgrel=1
pkgdesc="Unreal Tournament 2004 ECE native Linux version with data via GOG"
arch=('x86_64' 'aarch64')
url="https://www.gog.com/game/unreal_tournament_2004_ece"
license=('custom')
depends=('sdl' 'openal')
makedepends=('lgogdownloader' 'innoextract')
conflicts=('ut2004' 'ut2004-steam')
source=("setup_unreal_tournament_2004_1.0_(18947).exe::gogdownloader://unreal_tournament_2004_ece/en1installer0"
    "setup_unreal_tournament_2004_1.0_(18947)-1.bin::gogdownloader://unreal_tournament_2004_ece/en1installer1"
    "https://github.com/OldUnreal/UT2004Patches/releases/download/${pkgver}-preview-9/OldUnreal-UT2004Patch${pkgver}-Linux-60bd31b3.tar.bz2"
    "ut2004.desktop"
    "ut2004.png"
    "ut2004.sh")
sha256sums=('1f8712b4da90a22d822e4f2c2a4d841df2692be96d0f85f9064c6c77480c3b85'
            '81b6c1cf3931bf030d918461a134eff49921a0809cf215a6066639d0e6f0bf67'
            '0d08e3114dd184e5404afbf751c071576f573f913b39818416559c33308aeaad'
            'daf88b168e941d0bdd6c6637934a98d703f962afec7c64a1502c5b82ff66c6c8'
            '9fd35b406dc32caa6a0700bda89ac72f561346b919c4764d943bf4198ec032fd'
            '70fdb896c71a8e086b380c95bb03590e56a4390ee5cf4d49786d976988315702')

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

    # Install ut2004 Linux patch data.
    # The patch contains System (x86_64) and SystemARM64 directories with conflicting names but different archs.
    # We need to install them side-by-side, but SystemARM64 needs all the data files (.u, .int, etc) from System.
    
    msg2 "Extracting patch..."
    mkdir -p "$srcdir/patch_temp"
    tar --extract --file "$srcdir/OldUnreal-UT2004Patch${pkgver}-Linux-60bd31b3.tar.bz2" --directory "$srcdir/patch_temp"

    msg2 "Installing System (x86_64) patch..."
    cp -R "$srcdir/patch_temp/System/"* "$pkgdir/opt/ut2004/System/"
    
    # Copy other folders (Textures, etc) if present in patch root
    # Validating if other folders exist in patch
    for folder in "$srcdir/patch_temp/"*; do
        foldername=$(basename "$folder")
        if [ "$foldername" != "System" ] && [ "$foldername" != "SystemARM64" ] && [ -d "$folder" ]; then
             cp -R "$folder" "$pkgdir/opt/ut2004/"
        fi
    done

    msg2 "Creating SystemARM64..."
    # Copy the fully patched System folder to SystemARM64 to get all data files
    cp -R "$pkgdir/opt/ut2004/System" "$pkgdir/opt/ut2004/SystemARM64"
    
    msg2 "Overwriting SystemARM64 binaries..."
    # Overwrite with native ARM64 binaries
    cp -R "$srcdir/patch_temp/SystemARM64/"* "$pkgdir/opt/ut2004/SystemARM64/"
    
    # Cleanup
    rm -rf "$srcdir/patch_temp"

    # Install helper scripts.
    install -D -m 755 $srcdir/ut2004.sh \
         $pkgdir/opt/ut2004/Scripts/ut2004

    # Install desktop file.
    install -D -m 644 $srcdir/ut2004.desktop \
             $pkgdir/usr/share/applications/ut2004.desktop

    # Install icon file.
    install -D -m 644 $srcdir/ut2004.png \
             $pkgdir/usr/share/pixmaps/ut2004.png

    # Create symlinks to add the ut2004 startup and utility scripts to usr/bin
    ln -s /opt/ut2004/Scripts/ut2004 $pkgdir/usr/bin/ut2004 || return 1

     # Install script (no modification needed as it is now generic)
     install -D -m 755 $srcdir/ut2004.sh $pkgdir/opt/ut2004/Scripts/ut2004
}

