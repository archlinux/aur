# Maintainer: John-Michael Mulesa <jmulesa [at] gmail [dot] com>

pkgname=ut2004-data-steam
pkgver=3369
pkgrel=2
_steamid=13230
pkgdesc="Unreal Tournament 2004 ECE data from Steam"
arch=('any')
url="https://store.steampowered.com/app/13230/Unreal_Tournament_2004_Editors_Choice_Edition/"
license=('custom')
depends=()
makedepends=('steamcmd')
provides=('ut2004-data')
conflicts=('ut2004-data')
source=()
sha256sums=()

prepare() {
    mkdir -p "$srcdir/ut2004-steam"

    # Use steamcmd to get data.
    msg2 "Downloading data via SteamCMD..."
    printf "Enter your Steam username: "
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir "$srcdir/ut2004-steam" +login $steam_username "+app_update ${_steamid} validate" +quit
}

package() {
    install -d "$pkgdir/opt/ut2004"

    msg2 "Copying Steam data..."
    cp -R "$srcdir/ut2004-steam/"* "$pkgdir/opt/ut2004/"

    msg2 "Correcting directory case..."
    if [ -d "$pkgdir/opt/ut2004/maps" ]; then
        mv "$pkgdir/opt/ut2004/maps" "$pkgdir/opt/ut2004/Maps"
    fi

    msg2 "Moving default config files to User folder..."
    install -d "$pkgdir/opt/ut2004/User"
    for f in CacheRecords.ucl DefUnrealEd.ini DefUser.ini Default.ini User.ini; do
        if [ -f "$pkgdir/opt/ut2004/System/$f" ]; then
            mv "$pkgdir/opt/ut2004/System/$f" "$pkgdir/opt/ut2004/User/"
        fi
    done

    msg2 "Removing conflicting binaries and code from System folder..."
    find "$pkgdir/opt/ut2004/System" -type f \( -name "*.bin" -o -name "*.so" -o -name "*.exe" -o -name "*.dll" -o -name "*.u" -o -name "*.upl" -o -name "*.md5" \) -delete
    rm -f "$pkgdir/opt/ut2004/System/Build.ini"

    msg2 "Removing conflicting Web directory..."
    rm -rf "$pkgdir/opt/ut2004/Web"

    msg2 "Removing Steam-specific directories and files..."
    rm -rf "$pkgdir/opt/ut2004/steamapps"
    rm -rf "$pkgdir/opt/ut2004/ut2004 content 2"
    rm -rf "$pkgdir/opt/ut2004/directx9c"
    rm -f "$pkgdir/opt/ut2004/installscript.vdf"
    rm -f "$pkgdir/opt/ut2004/Manual/AdbeRdr60_enu_full.exe"

    msg2 "Removing conflicting Help files..."
    rm -f "$pkgdir/opt/ut2004/Help/DebuggerLogo.bmp"
    rm -f "$pkgdir/opt/ut2004/Help/InstallerLogo.bmp"

    msg2 "Fixing permissions..."
    find "$pkgdir/opt/ut2004" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/ut2004" -type f -exec chmod 644 {} +
}
