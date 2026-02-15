# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>
# Contributor: Alan Jenkins <alan.james.jenkins [at] gmail [dot] com>
# Contributor: NiteHogg <keith.b.elliott [at] gmail [dot] com>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Karsten Anderson <orbitcoder@gmail.com>

pkgname=ut2004-data-gog
_pkgvermaj=3369
_pkgvermin=2
pkgver=${_pkgvermaj}
pkgrel=2
pkgdesc="Unreal Tournament 2004 ECE data from GOG"
arch=('any')
url="https://www.gog.com/game/unreal_tournament_2004_ece"
license=('custom')
depends=()
makedepends=('lgogdownloader' 'innoextract')
provides=('ut2004-data')
conflicts=('ut2004-data')
source=("setup_unreal_tournament_2004_1.0_(18947).exe::gogdownloader://unreal_tournament_2004_ece/en1installer0"
        "setup_unreal_tournament_2004_1.0_(18947)-1.bin::gogdownloader://unreal_tournament_2004_ece/en1installer1")
sha256sums=('1f8712b4da90a22d822e4f2c2a4d841df2692be96d0f85f9064c6c77480c3b85'
            '81b6c1cf3931bf030d918461a134eff49921a0809cf215a6066639d0e6f0bf67')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
    install -d "$pkgdir/opt/ut2004"

    msg2 "Extracting GOG installer..."
    innoextract "$srcdir/setup_unreal_tournament_2004_1.0_(18947).exe" -d "$pkgdir/opt/ut2004/"

    cd "$pkgdir/opt/ut2004"

    msg2 "Moving app contents to root..."
    if [ -d "app" ]; then
        cp -r app/* .
        rm -rf app
    fi

    msg2 "Creating User folder from support files..."
    install -d "User"
    if [ -d "__support/app/System" ]; then
        cp -r "__support/app/System/"* "User/"
    fi

    msg2 "Moving GOG metadata..."
    install -d "GOG"
    mv goggame-* "GOG/" 2>/dev/null || true
    msg2 "Removing unnecessary GOG folders and files..."
    rm -rf "__redist" "__support" "commonappdata" "tmp" "app"
    rm -f "ut2004.txt" "webcache.zip"

    msg2 "Removing conflicting binaries and code from System folder..."
    find "$pkgdir/opt/ut2004/System" -type f \( -name "*.bin" -o -name "*.so" -o -name "*.exe" -o -name "*.dll" -o -name "*.u" -o -name "*.upl" -o -name "*.md5" -o -executable \) -delete
    rm -f "$pkgdir/opt/ut2004/System/Build.ini"

    msg2 "Removing conflicting Web directory..."
    rm -rf "$pkgdir/opt/ut2004/Web"

    msg2 "Removing conflicting Help files..."
    rm -f "$pkgdir/opt/ut2004/Help/DebuggerLogo.bmp"
    rm -f "$pkgdir/opt/ut2004/Help/InstallerLogo.bmp"

    msg2 "Fixing permissions..."
    find "$pkgdir/opt/ut2004" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/ut2004" -type f -exec chmod 644 {} +
}
