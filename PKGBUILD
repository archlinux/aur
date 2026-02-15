# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>
# Contributor: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-bin
pkgver=3374
pkgrel=1
pkgdesc="Unreal Tournament 2004 ECE native binaries (OldUnreal)"
arch=('x86_64' 'aarch64')
url="https://github.com/OldUnreal/UT2004Patches"
license=('custom')
depends=('ut2004-data' 'sdl3' 'openal' 'openmp' 'gcc-libs')
makedepends=()
provides=('ut2004')
conflicts=('ut2004-gog' 'ut2004-steam')
source=("https://github.com/OldUnreal/UT2004Patches/releases/download/${pkgver}-preview-9/OldUnreal-UT2004Patch${pkgver}-Linux-60bd31b3.tar.bz2"
        "ut2004.desktop"
        "ut2004.png"
        "ut2004.sh")
sha256sums=('0d08e3114dd184e5404afbf751c071576f573f913b39818416559c33308aeaad'
            'd5d57d91b4c01047861b989d79bccf45cc1f226cfe8378069cddaf6a8ee6826c'
            '9fd35b406dc32caa6a0700bda89ac72f561346b919c4764d943bf4198ec032fd'
            '9d70a3699572b986a53be92f715d546ed191f12960751f298439e7f54733d065')

package() {
    # Making sure directories exist.
    install -d "$pkgdir/usr/share/{applications,pixmaps,licenses}"
    install -d "$pkgdir/opt/ut2004"
    install -d "$pkgdir/opt/ut2004/System"
    install -d "$pkgdir/usr/bin/"

    msg2 "Installing System binaries..."
    
    # Install standard System/ folder first (contains x86_64 binaries and common data)
    cp -R "$srcdir/System/"* "$pkgdir/opt/ut2004/System/"
    
    # If ARM64, overwrite with SystemARM64 contents
    if [ "$CARCH" == "aarch64" ]; then
        msg2 "Overwriting with ARM64 binaries..."
        cp -R "$srcdir/SystemARM64/"* "$pkgdir/opt/ut2004/System/"
    fi
    
    # Copy other folders (Textures, etc) if present in patch root
    for folder in "$srcdir/"*; do
        foldername=$(basename "$folder")
        if [ "$foldername" != "System" ] && [ "$foldername" != "SystemARM64" ] && [ -d "$folder" ]; then
             # Skip pkg and src dirs if they appear
             if [[ "$foldername" == "pkg" || "$foldername" == "src" ]]; then continue; fi
             cp -R "$folder" "$pkgdir/opt/ut2004/"
        fi
    done

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
