# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>
# Contributor: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-bin
pkgver=3374
pkgrel=5
pkgdesc="Unreal Tournament 2004 ECE native binaries (OldUnreal)"
arch=('x86_64' 'aarch64')
url="https://github.com/OldUnreal/UT2004Patches"
license=('custom')
depends=('ut2004-data' 'sdl3' 'openal' 'openmp' 'gcc-libs' 'alsa-lib' 'libgl')
makedepends=()
provides=('ut2004')
conflicts=('ut2004-gog' 'ut2004-steam')
source=("https://github.com/OldUnreal/UT2004Patches/releases/download/${pkgver}-preview-9/OldUnreal-UT2004Patch${pkgver}-Linux-60bd31b3.tar.bz2"
        "ut2004.desktop"
        "ut2004.png"
        "ut2004.sh")
sha256sums=('0d08e3114dd184e5404afbf751c071576f573f913b39818416559c33308aeaad'
            '23aaf1232a36a479fd3ab5ee0045ec00d6e52b5c6e27bcf33a2c7386d3251882'
            '9fd35b406dc32caa6a0700bda89ac72f561346b919c4764d943bf4198ec032fd'
            '348caa8129c581df2e8eeeda2c53b4aa376ba7b4007bb18695e98dc574a32b8d')

package() {
    # Making sure directories exist.
    install -d "$pkgdir/opt/ut2004"
    install -d "$pkgdir/opt/ut2004/System"
    install -d "$pkgdir/usr/bin/"

    msg2 "Installing System binaries..."
    
    # Install standard System/ folder first (contains x86_64 binaries and common data)
    cp -R "$srcdir/System/"* "$pkgdir/opt/ut2004/System/"
    
    # If ARM64, overwrite with SystemARM64 contents
    if [ "$CARCH" == "aarch64" ]; then
        msg2 "Overwriting with ARM64 binaries..."
        for f in "$srcdir/SystemARM64/"*; do
            if [ -L "$f" ] && [[ "$(readlink "$f")" == ../System/* ]]; then
                continue
            fi

            # https://github.com/OldUnreal/UT2004Patches/issues/250#issuecomment-3904913839
            if [[ "$(basename "$f")" == "Default.ini" ]] || [[ "$(basename "$f")" == "DefUser.ini" ]]; then
                continue
            fi

            cp -R "$f" "$pkgdir/opt/ut2004/System/"
        done
    fi

    msg2 "Creating UserPatch folder from System defaults..."
    install -d "$pkgdir/opt/ut2004/UserPatch"
    for f in CacheRecords.ucl DefUnrealEd.ini DefUser.ini Default.ini User.ini; do
        if [ -f "$pkgdir/opt/ut2004/System/$f" ]; then
            cp "$pkgdir/opt/ut2004/System/$f" "$pkgdir/opt/ut2004/UserPatch/"
        fi
    done

    # Copy other folders (Textures, etc) if present in patch root
    for folder in "$srcdir/"*; do
        foldername=$(basename "$folder")
        if [ "$foldername" != "System" ] && [ "$foldername" != "SystemARM64" ] && [ -d "$folder" ]; then
             cp -R "$folder" "$pkgdir/opt/ut2004/"
        fi
    done

    msg2 "Fixing permissions..."
    find "$pkgdir/opt/ut2004" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/ut2004" -type f -exec chmod 644 {} +
    find "$pkgdir/opt/ut2004/System" -type f \( -name "UT2004" -o -name "UCC" -o -name "*.so" -o -name "*.so.*" \) -exec chmod 755 {} +

    # Install helper scripts.
    install -D -m 755 "$srcdir/ut2004.sh" \
         "$pkgdir/opt/ut2004/System/ut2004.sh"

    # Install desktop file.
    install -D -m 644 "$srcdir/ut2004.desktop" \
             "$pkgdir/usr/share/applications/ut2004.desktop"

    # Install icon file.
    install -D -m 644 "$srcdir/ut2004.png" \
             "$pkgdir/usr/share/pixmaps/ut2004.png"

    # Create symlinks to add the ut2004 startup and utility scripts to usr/bin
    ln -s /opt/ut2004/System/ut2004.sh "$pkgdir/usr/bin/ut2004" || return 1
}
