# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=unreal-tournament-data-steam
pkgver=436
pkgrel=3
_steamid=13240
pkgdesc="Unreal Tournament 99 (GOTY) data from Steam"
arch=('any')
url="https://store.steampowered.com/app/13240/Unreal_Tournament_GOTY/"
license=('custom')
depends=()
makedepends=('steamcmd')
provides=('unreal-tournament-data')
conflicts=('unreal-tournament-data')
source=()
sha256sums=()

prepare() {
    mkdir -p "$srcdir/ut99-steam"

    msg2 "Downloading data via SteamCMD..."
    printf "Enter your Steam username: "
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir "$srcdir/ut99-steam" +login $steam_username "+app_update ${_steamid} validate" +quit
}

package() {
    install -d "$pkgdir/opt/unreal-tournament"

    msg2 "Copying Steam data..."
    cp -R "$srcdir/ut99-steam/"* "$pkgdir/opt/unreal-tournament/"

    msg2 "Moving default config files to User folder..."
    install -d "$pkgdir/opt/unreal-tournament/User"
    for f in DefUser.ini Default.ini User.ini UnrealTournament.ini; do
        if [ -f "$pkgdir/opt/unreal-tournament/System/$f" ]; then
            mv "$pkgdir/opt/unreal-tournament/System/$f" "$pkgdir/opt/unreal-tournament/User/"
        fi
    done

    msg2 "Removing conflicting binaries and code from System folder..."
    find "$pkgdir/opt/unreal-tournament/System" -type f \( -name "*.exe" -o -name "*.dll" -o -name "*.so" -o -name "*.bin" \) -delete

    msg2 "Removing files conflicting with binary package..."
    rm -f "$pkgdir/opt/unreal-tournament/Help/ReleaseNotes.htm"
    p="$pkgdir/opt/unreal-tournament"
    rm -f "$p/System/Core.u" "$p/System/Editor.u" "$p/System/Engine.u" "$p/System/Fire.u"
    rm -f "$p/System/IpDrv.u" "$p/System/IpServer.u" "$p/System/UBrowser.u" "$p/System/UMenu.u"
    rm -f "$p/System/UTBrowser.u" "$p/System/UTMenu.u" "$p/System/UTServerAdmin.u"
    rm -f "$p/System/UWeb.u" "$p/System/UWindow.u" "$p/System/UnrealI.u" "$p/System/UnrealShare.u"
    rm -f "$p/System/de.u" "$p/System/epiccustommodels.u" "$p/System/multimesh.u"
    rm -f "$p/System/relics.u" "$p/System/relicsbindings.u"
    rm -f "$p/Textures/LadderFonts.utx" "$p/Textures/UWindowFonts.utx"
    rm -rf "$pkgdir/opt/unreal-tournament/Web"

    msg2 "Removing Steam-specific directories and files..."
    rm -rf "$pkgdir/opt/unreal-tournament/steamapps"
    rm -rf "$pkgdir/opt/unreal-tournament/common"
    rm -rf "$pkgdir/opt/unreal-tournament/directx9c"
    rm -f "$pkgdir/opt/unreal-tournament/installscript.vdf"

    msg2 "Fixing permissions..."
    find "$pkgdir/opt/unreal-tournament" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/unreal-tournament" -type f -exec chmod 644 {} +
}
