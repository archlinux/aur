# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="gog-stardew-valley-smapi"
pkgver=4.0.8
pkgrel=1
pkgdesc="The modding API for Stardew Valley."
url="https://github.com/Pathoschild/SMAPI"
license=("LGPL-3.0-only")
arch=("x86_64")
options=("strip" "!debug")
depends=("gog-stardew-valley" "kdialog" "bash")
makepedends=("imagemagick" "dotnet-sdk")
install="gog-stardew-valley-smapi.install"

source=(
    "$url/archive/refs/tags/$pkgver.zip"
    "SMAPI.desktop"
    "smapi.sh"
)

sha256sums=(
    "3ed5422e014bef1b1abbcd853248ca84728f0db1d812cef590afb39d31e65d0a"
    "dd4e8a2c62d5be1d2aa14d95ffeb7154646eb92916cdc9a9bea41f72b16e887d"
    "22ed2c0b9e05f211bc5e2e756a1766bf1fbe11def9368cb5f94fb09424fc1e56"
)

prepare() {
    # Prepare icon
    magick "$srcdir/SMAPI-$pkgver/src/SMAPI/Icon.bmp" "$srcdir/Icon.png"

    # Change saves backups path from GamePath to DataPath ($HOME/.config/StardewValley/save-backups) for SaveBackup mod
    sed -i 's|private readonly string BackupFolder = Path.Combine(Constants.GamePath, "save-backups");|private readonly string BackupFolder = Path.Combine(Constants.DataPath, "save-backups");|' \
    "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/ModEntry.cs"

    # SMAPI version
    cd "$srcdir/SMAPI-$pkgver"

    sed "s/<Version>.+<\/Version>/<Version>$pkgver<\/Version>/" "build/common.targets" --in-place --regexp-extended
    sed "s/RawApiVersion = \".+?\";/RawApiVersion = \"$pkgver\";/" "src/SMAPI/Constants.cs" --in-place --regexp-extended

    for modName in "ConsoleCommands" "SaveBackup"; do
        sed "s/\"(Version|MinimumApiVersion)\": \".+?\"/\"\1\": \"$pkgver\"/g" "src/SMAPI.Mods.$modName/manifest.json" --in-place --regexp-extended
    done
}

build() {
    cd "$srcdir/SMAPI-$pkgver"

    # SMAPI on linux
    dotnet publish "src/SMAPI" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/gog-stardew-valley" -p:CopyToGameFolder="false" --self-contained true

    # ConsoleCommands for SMAPI on linux
    dotnet publish "src/SMAPI.Mods.ConsoleCommands" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/gog-stardew-valley" -p:CopyToGameFolder="false" --self-contained false

    # SaveBackup for SMAPI on linux
    dotnet publish "src/SMAPI.Mods.SaveBackup" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/gog-stardew-valley" -p:CopyToGameFolder="false" --self-contained false
}

package() {
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -d "$pkgdir/opt/gog-stardew-valley/smapi-internal"
    install -d "$pkgdir/opt/gog-stardew-valley/smapi-internal/i18n"
    install -d "$pkgdir/opt/gog-stardew-valley/Mods/ConsoleCommands"
    install -d "$pkgdir/opt/gog-stardew-valley/Mods/SaveBackup"

    # SMAPI
    install -m 755 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI" "$pkgdir/opt/gog-stardew-valley/StardewModdingAPI"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI.dll" "$pkgdir/opt/gog-stardew-valley/StardewModdingAPI.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI.xml" "$pkgdir/opt/gog-stardew-valley/StardewModdingAPI.xml"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Installer/assets/runtimeconfig.json" "$pkgdir/opt/gog-stardew-valley/StardewModdingAPI.runtimeconfig.json"
    ln -s "/opt/gog-stardew-valley/Stardew Valley.deps.json" "$pkgdir/opt/gog-stardew-valley/StardewModdingAPI.deps.json"


    # SMAPI Mods
    ## ConsoleCommands
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.ConsoleCommands/bin/Release/linux-x64/ConsoleCommands.dll" "$pkgdir/opt/gog-stardew-valley/Mods/ConsoleCommands/ConsoleCommands.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.ConsoleCommands/bin/Release/linux-x64/manifest.json" "$pkgdir/opt/gog-stardew-valley/Mods/ConsoleCommands/manifest.json"
    ## SaveBackup
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/bin/Release/linux-x64/SaveBackup.dll" "$pkgdir/opt/gog-stardew-valley/Mods/SaveBackup/SaveBackup.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/bin/Release/linux-x64/manifest.json" "$pkgdir/opt/gog-stardew-valley/Mods/SaveBackup/manifest.json"


    # smapi-internal
    ## i18n
    cp -r "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/i18n/"* "$pkgdir/opt/gog-stardew-valley/smapi-internal/i18n/"

    ## config & metadata .json
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.config.json" "$pkgdir/opt/gog-stardew-valley/smapi-internal/config.json"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.metadata.json" "$pkgdir/opt/gog-stardew-valley/smapi-internal/metadata.json"
    ## Disable update check
    sed -i 's|"CheckForUpdates": true,|"CheckForUpdates": false,|' "$pkgdir/opt/gog-stardew-valley/smapi-internal/config.json"

    ## other important stuff
    for file in "0Harmony.dll" "0Harmony.xml" "Mono.Cecil.dll" "Mono.Cecil.Mdb.dll" "Mono.Cecil.Pdb.dll" "MonoMod.Common.dll" "Newtonsoft.Json.dll" "Pathoschild.Http.Client.dll" "Pintail.dll" "TMXTile.dll" "SMAPI.Toolkit.dll" "SMAPI.Toolkit.xml" "SMAPI.Toolkit.CoreInterfaces.dll" "SMAPI.Toolkit.CoreInterfaces.xml" "System.Net.Http.Formatting.dll"; do
        install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/$file" "$pkgdir/opt/gog-stardew-valley/smapi-internal/$file"
    done


    # SMAPI Launcher
    install -m 755 "$srcdir/smapi.sh" "$pkgdir/usr/bin/smapi"

    # Icon
    install -m 644 "$srcdir/Icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/smapi.png"

    # XDG file
    install -m 644 "$srcdir/SMAPI.desktop" "$pkgdir/usr/share/applications/SMAPI.desktop"
}
