# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=unreal-tournament-data-gog
pkgver=436
pkgrel=1
pkgdesc="Unreal Tournament 99 (GOTY) data from GOG"
arch=('any')
url="https://www.gog.com/game/unreal_tournament_goty"
license=('custom')
depends=()
makedepends=('lgogdownloader' 'innoextract')
provides=('unreal-tournament-data')
conflicts=('unreal-tournament-data')
source=("setup_unreal_tournament_goty_2.0.0.5.exe::gogdownloader://unreal_tournament_goty/en1installer0")
sha256sums=('SKIP')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
    install -d "$pkgdir/opt/unreal-tournament"

    msg2 "Extracting GOG installer..."
    innoextract "$srcdir/setup_unreal_tournament_goty_2.0.0.5.exe" -d "$pkgdir/opt/unreal-tournament/"

    cd "$pkgdir/opt/unreal-tournament"

    msg2 "Moving app contents to root..."
    if [ -d "app" ]; then
        cp -r app/* .
        rm -rf app
    fi

    msg2 "Moving GOG metadata..."
    install -d "GOG"
    mv gfw_high.ico gog_ut_goty.sdb "GOG/" 2>/dev/null || true
    
    msg2 "Removing unnecessary GOG folders and files..."
    rm -rf "tmp" "app"
    rm -f GameuxInstallHelper.dll gog.ico Support.ico

    msg2 "Moving default config files to User folder (from System)..."
    install -d "User"
    for f in DefUser.ini Default.ini User.ini UnrealTournament.ini; do
        if [ -f "System/$f" ]; then
            mv "System/$f" "User/"
        fi
    done

    msg2 "Removing conflicting binaries and code from System folder..."
    find "System" -type f \( -name "*.exe" -o -name "*.dll" -o -name "*.so" -o -name "*.bin" \) -delete

    msg2 "Removing files conflicting with binary package..."
    rm -f "Help/ReleaseNotes.htm"
    rm -f "System/Core.u" "System/Editor.u" "System/Engine.u" "System/Fire.u"
    rm -f "System/IpDrv.u" "System/IpServer.u" "System/UBrowser.u" "System/UMenu.u"
    rm -f "System/UTBrowser.u" "System/UTMenu.u" "System/UTServerAdmin.u"
    rm -f "System/UWeb.u" "System/UWindow.u" "System/UnrealI.u" "System/UnrealShare.u"
    rm -f "System/de.u" "System/epiccustommodels.u" "System/multimesh.u"
    rm -f "System/relics.u" "System/relicsbindings.u"
    rm -f "Textures/LadderFonts.utx" "Textures/UWindowFonts.utx"
    rm -rf "Web"
}
