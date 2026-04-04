# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="smapi-for-stardew-valley"
pkgver=4.5.2
pkgrel=1
pkgdesc="The modding API for Stardew Valley."
url="https://github.com/Pathoschild/SMAPI"
license=("LGPL-3.0-only")
arch=("x86_64")
options=("strip" "!debug")
depends=("gog-stardew-valley" "hicolor-icon-theme" "kdialog" "bash")
makepedends=("imagemagick" "dotnet-sdk-6.0")
install="smapi-for-stardew-valley.install"

source=(
    "SMAPI-$pkgver::git+https://github.com/Pathoschild/SMAPI#tag=$pkgver"
    "smapi.desktop"
    "smapi.sh"
)

sha256sums=(
    '84ed4cb6501c83ad297f79df4cd037714c347df8b7fc26a9b802d2321fc5da54'
    '59b2f16bf7a0314414598493640007749f5fe06df10ff55caa13f326106a0655'
    'a9f7ae9e24d07e47ccd5975b09ed465e629f03bf6e6078b3b144687b6affad9c'
)

prepare() {
    # Prepare icon
    magick "$srcdir/SMAPI-$pkgver/src/SMAPI/Icon.bmp" "$srcdir/Icon.png"
    magick "$srcdir/Icon.png" -scale 1024x1024 "$srcdir/Icon_1024x1024.png"

    # Change saves backups path from GamePath to DataPath ($HOME/.config/StardewValley/save-backups) for SaveBackup mod
    sed -i 's|private readonly string BackupFolder = Path.Combine(Constants.GamePath, "save-backups");|private readonly string BackupFolder = Path.Combine(Constants.DataPath, "save-backups");|' \
    "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/ModEntry.cs"

    # Change mods blacklist file path in smapi code to let blacklist fetching work right
    sed -i 's|internal static string ApiBlacklistPath => Path.Combine(Constants.InternalFilesPath, "blacklist.json");|internal static string ApiBlacklistPath => Path.Combine(Constants.DataPath, "blacklist.json");|' \
    "$srcdir/SMAPI-$pkgver/src/SMAPI/Constants.cs"
    sed -i 's|internal static string ApiBlacklistFetchedPath => Path.Combine(Constants.InternalFilesPath, "blacklist-updated.json");|internal static string ApiBlacklistFetchedPath => Path.Combine(Constants.DataPath, "blacklist-updated.json");|' \
    "$srcdir/SMAPI-$pkgver/src/SMAPI/Constants.cs"

    # Change SMAPI options file (config.user.json) path for mod "Generic Mod Config Menu UI"
    sed -i 's|internal static string ApiUserConfigPath => Path.Combine(Constants.InternalFilesPath, "config.user.json");|internal static string ApiUserConfigPath => Path.Combine(Constants.DataPath, "config.user.json");|' \
    "$srcdir/SMAPI-$pkgver/src/SMAPI/Constants.cs"

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
    dotnet publish "src/SMAPI" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/gog-stardew-valley/game" -p:CopyToGameFolder="false" --self-contained true

    # ConsoleCommands for SMAPI on linux
    dotnet publish "src/SMAPI.Mods.ConsoleCommands" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/gog-stardew-valley/game" -p:CopyToGameFolder="false" --self-contained false

    # SaveBackup for SMAPI on linux
    dotnet publish "src/SMAPI.Mods.SaveBackup" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/gog-stardew-valley/game" -p:CopyToGameFolder="false" --self-contained false
}

package() {
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/pixmaps/"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -d "$pkgdir/opt/gog-stardew-valley/game/smapi-internal"
    install -d "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/i18n"
    install -d "$pkgdir/opt/gog-stardew-valley/game/Mods/ConsoleCommands"
    install -d "$pkgdir/opt/gog-stardew-valley/game/Mods/SaveBackup"

    # SMAPI
    install -m 755 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI" "$pkgdir/opt/gog-stardew-valley/game/StardewModdingAPI"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI.dll" "$pkgdir/opt/gog-stardew-valley/game/StardewModdingAPI.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI.xml" "$pkgdir/opt/gog-stardew-valley/game/StardewModdingAPI.xml"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Installer/assets/runtimeconfig.json" "$pkgdir/opt/gog-stardew-valley/game/StardewModdingAPI.runtimeconfig.json"
    ln -s "/opt/gog-stardew-valley/game/Stardew Valley.deps.json" "$pkgdir/opt/gog-stardew-valley/game/StardewModdingAPI.deps.json"


    # SMAPI Mods
    ## ConsoleCommands
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.ConsoleCommands/bin/Release/linux-x64/ConsoleCommands.dll" "$pkgdir/opt/gog-stardew-valley/game/Mods/ConsoleCommands/ConsoleCommands.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.ConsoleCommands/bin/Release/linux-x64/manifest.json" "$pkgdir/opt/gog-stardew-valley/game/Mods/ConsoleCommands/manifest.json"
    ## SaveBackup
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/bin/Release/linux-x64/SaveBackup.dll" "$pkgdir/opt/gog-stardew-valley/game/Mods/SaveBackup/SaveBackup.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/bin/Release/linux-x64/manifest.json" "$pkgdir/opt/gog-stardew-valley/game/Mods/SaveBackup/manifest.json"


    # smapi-internal
    ## i18n
    cp -r "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/i18n/"* "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/i18n/"

    ## config & metadata & blacklist .json
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.config.json" "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/config.json"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.metadata.json" "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/metadata.json"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.blacklist.json" "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/blacklist.json"
    ## Disable update check
    sed -i 's|"CheckForUpdates": true,|"CheckForUpdates": false,|' "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/config.json"

    ## other important stuff
    for file in "0Harmony.dll" "0Harmony.xml" "Markdig.dll" "Mono.Cecil.dll" "Mono.Cecil.Mdb.dll" "Mono.Cecil.Pdb.dll" "MonoMod.Common.dll" "Newtonsoft.Json.dll" "Pathoschild.Http.Client.dll" "Pintail.dll" "TMXTile.dll" "SMAPI.Toolkit.dll" "SMAPI.Toolkit.xml" "SMAPI.Toolkit.CoreInterfaces.dll" "SMAPI.Toolkit.CoreInterfaces.xml" "System.Net.Http.Formatting.dll"; do
        install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/$file" "$pkgdir/opt/gog-stardew-valley/game/smapi-internal/$file"
    done


    # SMAPI Launcher
    install -m 755 "$srcdir/smapi.sh" "$pkgdir/usr/bin/smapi"

    # Icon
    install -m 644 "$srcdir/Icon_1024x1024.png" "$pkgdir/usr/share/pixmaps/smapi.png"
    install -m 644 "$srcdir/Icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/smapi.png"

    # XDG file
    install -m 644 "$srcdir/smapi.desktop" "$pkgdir/usr/share/applications/smapi.desktop"
}
