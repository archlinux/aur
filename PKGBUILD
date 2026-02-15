# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=unreal-tournament-bin
pkgver=469e
pkgrel=2
pkgdesc="Unreal Tournament 99 (GOTY) native binaries (OldUnreal)"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/OldUnreal/UnrealTournamentPatches"
license=('custom')
depends=('unreal-tournament-data' 'sdl2' 'openal' 'alsa-lib' 'libgl')
makedepends=()
provides=('unreal-tournament')
conflicts=('unreal-tournament')
source_i686=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2")
source_x86_64=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2")
source_aarch64=("https://github.com/OldUnreal/UnrealTournamentPatches/releases/download/v${pkgver}/OldUnreal-UTPatch${pkgver}-Linux-arm64.tar.bz2")
source=("unreal-tournament.sh"
        "unreal-tournament.desktop"
        "unreal-tournament.png")
sha256sums=('91d1698c2a90df28638d9bc258cd9b9ae7fa0616ec713d02bdab706eb52502dd'
            '944b95fc51c214e5bacf96d613a46fe95fdb6f99102cb8b83dacd76037540ffe'
            '69c9c5eb9ff8f6ee5cbfd9df5d16f68461d682fbb15c75a34627eaff2474190e')
sha256sums_i686=('cbd6d8016efb30e3982757a582c688532803721ec1ec738fc28af9b3e15d3c14')
sha256sums_x86_64=('08c806aa3721b1970045aa158ad90051329d982e8a9a3661153900e9ccbf6b0c')
sha256sums_aarch64=('4c3978073b12b049c3ffdeb4d275cfc7a2313650f3eb5b94db06fbfee77c3e3b')

package() {
    install -d "$pkgdir/opt/unreal-tournament"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/pixmaps"
    
    msg2 "Installing binaries for $CARCH..."
    if [ "$CARCH" == "x86_64" ]; then
        tar -xjf "OldUnreal-UTPatch${pkgver}-Linux-amd64.tar.bz2" -C "$pkgdir/opt/unreal-tournament"
        install -d "$pkgdir/opt/unreal-tournament/System"
        cp -r "$pkgdir/opt/unreal-tournament/System64/"* "$pkgdir/opt/unreal-tournament/System/"
        rm -rf "$pkgdir/opt/unreal-tournament/System64"
        
    elif [ "$CARCH" == "aarch64" ]; then
        tar -xjf "OldUnreal-UTPatch${pkgver}-Linux-arm64.tar.bz2" -C "$pkgdir/opt/unreal-tournament"
        install -d "$pkgdir/opt/unreal-tournament/System"
        cp -r "$pkgdir/opt/unreal-tournament/SystemARM64/"* "$pkgdir/opt/unreal-tournament/System/"
        rm -rf "$pkgdir/opt/unreal-tournament/SystemARM64"
        
    else
        tar -xjf "OldUnreal-UTPatch${pkgver}-Linux-x86.tar.bz2" -C "$pkgdir/opt/unreal-tournament"
    fi

    msg2 "Creating UserPatch folder from System defaults..."
    install -d "$pkgdir/opt/unreal-tournament/UserPatch"
    for f in CacheRecords.ucl DefUnrealEd.ini DefUser.ini Default.ini User.ini; do
        if [ -f "$pkgdir/opt/unreal-tournament/System/$f" ]; then
            cp "$pkgdir/opt/unreal-tournament/System/$f" "$pkgdir/opt/unreal-tournament/UserPatch/"
        fi
    done

    msg2 "Fixing permissions..."
    find "$pkgdir/opt/unreal-tournament" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/unreal-tournament" -type f -exec chmod 644 {} +
    find "$pkgdir/opt/unreal-tournament/System" -type f \( -name "ut-bin*" -o -name "ucc-bin*" -o -name "*.so" -o -name "*.so.*" \) -exec chmod 755 {} +

    # Install run script
    install -m 755 "unreal-tournament.sh" "$pkgdir/usr/bin/unreal-tournament"
    
    # Install desktop file
    install -m 644 "unreal-tournament.desktop" "$pkgdir/usr/share/applications/"
    
    # Install icon
    install -m 644 "unreal-tournament.png" "$pkgdir/usr/share/pixmaps/"
}
