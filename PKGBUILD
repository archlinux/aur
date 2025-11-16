# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="smapi-for-stardew-valley"
pkgver=4.3.2
pkgrel=1
pkgdesc="The modding API for Stardew Valley."
url="https://github.com/Pathoschild/SMAPI"
license=("LGPL-3.0-only")
arch=("x86_64")
options=("strip" "!debug")
depends=("stardew-valley" "kdialog" "bash")
makepedends=("imagemagick" "dotnet-sdk")
install="smapi-for-stardew-valley.install"

source=(
    "$url/archive/refs/tags/$pkgver.zip"
    "smapi.desktop"
    "smapi.sh"
)

sha256sums=(
    'ed8e9ae12fc83a875f52fbc24eb7623c8981826083edc1b16b240beaabbcee51'
    '7f5e18cf22f8a0785665a2cb50e98a31cb34fc0171164fedc3982e1a2a69935e'
    '6a3472426847e04efb77680ebb427bf4d323cf673445d5cd8bdb2898014c073a'
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
    dotnet publish "src/SMAPI" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/stardew-valley" -p:CopyToGameFolder="false" --self-contained true

    # ConsoleCommands for SMAPI on linux
    dotnet publish "src/SMAPI.Mods.ConsoleCommands" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/stardew-valley" -p:CopyToGameFolder="false" --self-contained false

    # SaveBackup for SMAPI on linux
    dotnet publish "src/SMAPI.Mods.SaveBackup" --configuration "Release" -v minimal --runtime "linux-x64" -p:OS="Unix" -p:GamePath="/opt/stardew-valley" -p:CopyToGameFolder="false" --self-contained false
}

package() {
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/pixmaps/"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -d "$pkgdir/opt/stardew-valley/smapi-internal"
    install -d "$pkgdir/opt/stardew-valley/smapi-internal/i18n"
    install -d "$pkgdir/opt/stardew-valley/Mods/ConsoleCommands"
    install -d "$pkgdir/opt/stardew-valley/Mods/SaveBackup"

    # SMAPI
    install -m 755 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI" "$pkgdir/opt/stardew-valley/StardewModdingAPI"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI.dll" "$pkgdir/opt/stardew-valley/StardewModdingAPI.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/StardewModdingAPI.xml" "$pkgdir/opt/stardew-valley/StardewModdingAPI.xml"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Installer/assets/runtimeconfig.json" "$pkgdir/opt/stardew-valley/StardewModdingAPI.runtimeconfig.json"
    ln -s "/opt/stardew-valley/Stardew Valley.deps.json" "$pkgdir/opt/stardew-valley/StardewModdingAPI.deps.json"


    # SMAPI Mods
    ## ConsoleCommands
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.ConsoleCommands/bin/Release/linux-x64/ConsoleCommands.dll" "$pkgdir/opt/stardew-valley/Mods/ConsoleCommands/ConsoleCommands.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.ConsoleCommands/bin/Release/linux-x64/manifest.json" "$pkgdir/opt/stardew-valley/Mods/ConsoleCommands/manifest.json"
    ## SaveBackup
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/bin/Release/linux-x64/SaveBackup.dll" "$pkgdir/opt/stardew-valley/Mods/SaveBackup/SaveBackup.dll"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI.Mods.SaveBackup/bin/Release/linux-x64/manifest.json" "$pkgdir/opt/stardew-valley/Mods/SaveBackup/manifest.json"


    # smapi-internal
    ## i18n
    cp -r "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/i18n/"* "$pkgdir/opt/stardew-valley/smapi-internal/i18n/"

    ## config & metadata & blacklist .json
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.config.json" "$pkgdir/opt/stardew-valley/smapi-internal/config.json"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.metadata.json" "$pkgdir/opt/stardew-valley/smapi-internal/metadata.json"
    install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/SMAPI.blacklist.json" "$pkgdir/opt/stardew-valley/smapi-internal/blacklist.json"
    ## Disable update check
    sed -i 's|"CheckForUpdates": true,|"CheckForUpdates": false,|' "$pkgdir/opt/stardew-valley/smapi-internal/config.json"

    ## other important stuff
    for file in "0Harmony.dll" "0Harmony.xml" "Markdig.dll" "Mono.Cecil.dll" "Mono.Cecil.Mdb.dll" "Mono.Cecil.Pdb.dll" "MonoMod.Common.dll" "Newtonsoft.Json.dll" "Pathoschild.Http.Client.dll" "Pintail.dll" "TMXTile.dll" "SMAPI.Toolkit.dll" "SMAPI.Toolkit.xml" "SMAPI.Toolkit.CoreInterfaces.dll" "SMAPI.Toolkit.CoreInterfaces.xml" "System.Net.Http.Formatting.dll"; do
        install -m 644 "$srcdir/SMAPI-$pkgver/src/SMAPI/bin/Release/linux-x64/$file" "$pkgdir/opt/stardew-valley/smapi-internal/$file"
    done


    # SMAPI Launcher
    install -m 755 "$srcdir/smapi.sh" "$pkgdir/usr/bin/smapi"

    # Icon
    install -m 644 "$srcdir/Icon_1024x1024.png" "$pkgdir/usr/share/pixmaps/smapi.png"
    install -m 644 "$srcdir/Icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/smapi.png"

    # XDG file
    install -m 644 "$srcdir/smapi.desktop" "$pkgdir/usr/share/applications/smapi.desktop"
}
