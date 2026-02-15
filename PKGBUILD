# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=unreal-tournament-data-archiveorg
pkgver=436
pkgrel=1
pkgdesc="Unreal Tournament 99 (GOTY) data from Archive.org ISO"
arch=('any')
url="https://archive.org/details/ut-goty"
license=('custom')
depends=()
makedepends=('p7zip')
provides=('unreal-tournament-data')
conflicts=('unreal-tournament-data')
source=("https://archive.org/download/ut-goty/UT_GOTY_CD1.iso")
sha256sums=('e184984ca88f001c5ddd52035d76cd64e266e26c74975161b5ed72366c74704f')

prepare() {
    mkdir -p "$srcdir/ut99-iso"
    cd "$srcdir/ut99-iso"
    
    msg2 "Extracting CD1..."
    7z x "$srcdir/UT_GOTY_CD1.iso" -y
}

package() {
    install -d "$pkgdir/opt/unreal-tournament"

    cd "$srcdir/ut99-iso"

    msg2 "Organizing and copying data..."
    cp -r * "$pkgdir/opt/unreal-tournament/"

    rm -f "$pkgdir/opt/unreal-tournament/Autorun.inf"
    rm -f "$pkgdir/opt/unreal-tournament/Setup.exe"
    rm -f "$pkgdir/opt/unreal-tournament/"*.txt
    rm -f "$pkgdir/opt/unreal-tournament/"*.TXT

    msg2 "Cleaning System directory..."
    find "$pkgdir/opt/unreal-tournament/System" -type f \( -name "*.exe" -o -name "*.dll" -o -name "*.so" -o -name "*.bin" \) -delete

    msg2 "Removing files conflicting with binary package..."
    p="$pkgdir/opt/unreal-tournament"
    
    rm -f "$p/Help/ReleaseNotes.htm"
    rm -f "$p/System/Core.u" "$p/System/Editor.u" "$p/System/Engine.u" "$p/System/Fire.u"
    rm -f "$p/System/IpDrv.u" "$p/System/IpServer.u" "$p/System/UBrowser.u" "$p/System/UMenu.u"
    rm -f "$p/System/UTBrowser.u" "$p/System/UTMenu.u" "$p/System/UTServerAdmin.u"
    rm -f "$p/System/UWeb.u" "$p/System/UWindow.u" "$p/System/UnrealI.u" "$p/System/UnrealShare.u"
    rm -f "$p/System/de.u" "$p/System/epiccustommodels.u" "$p/System/multimesh.u"
    rm -f "$p/System/relics.u" "$p/System/relicsbindings.u"
    rm -f "$p/Textures/LadderFonts.utx" "$p/Textures/UWindowFonts.utx"
    rm -rf "$p/Web" "$p/DirectX7" "$p/GameSpy" "$p/Heat"

    msg2 "Moving default config files to User folder..."
    install -d "$pkgdir/opt/unreal-tournament/User"
    for f in DefUser.ini Default.ini User.ini UnrealTournament.ini; do
        if [ -f "$pkgdir/opt/unreal-tournament/System/$f" ]; then
            mv "$pkgdir/opt/unreal-tournament/System/$f" "$pkgdir/opt/unreal-tournament/User/"
        fi
    done
}
