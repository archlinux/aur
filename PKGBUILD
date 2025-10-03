# See `Access Key` section of https://manual.gamemaker.io/lts/en/Settings/Building_via_Command_Line.htm
# to create an access key of GameMakerStudio. The set it as environment variable MAKEPKG_GAMEMAKER_ACCESS_KEY
# so we can use it to create license plist file, which is required for building game.

pkgname=dijeweled
pkgver=1.18
pkgrel=1
pkgdesc="A fan-made Bejeweled game."
arch=(x86_64)
url=https://github.com/LDinos/Dijeweled
license=(AGPL-3.0-or-later)
makedepends=(ffmpeg rsync unzip zip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LDinos/Dijeweled/archive/refs/tags/v$pkgver.tar.gz")
# https://github.com/bscotch/igor-setup
# https://help.gamemaker.io/hc/en-us/articles/235186168-Setting-Up-For-Ubuntu
_steam_runtime_code=scout
_steam_runtime=1.0.20250616.139563 # latest-steam-client-general-availability
source_x86_64=("igor-x86_64.zip::https://gms.yoyogames.com/igor_linux-x64.zip"
               "steam-runtime-sdk-$_steam_runtime_code-$_steam_runtime-x86_64.tar.gz::https://repo.steampowered.com/steamrt-images-$_steam_runtime_code/snapshots/$_steam_runtime/com.valvesoftware.SteamRuntime.Sdk-amd64%2Ci386-$_steam_runtime_code-sysroot.tar.gz")
sha256sums=('d10cd913a8b52c3f0f276b14f66e4afb1ed96284259a9d2114e8e99a56dcaa9f')
sha256sums_x86_64=('cb4ba26356e89b7d95ea3a2d4910ba6d4d795e60147ae350eafadb74390f6895'
                   '9bb2fde047c0818a364b8ec3a7f41ae4e8674f00995543e023c35a6fabeefcee')
noextract=("igor-$CARCH.zip"
           "steam-runtime-sdk-$_steam_runtime_code-$_steam_runtime-$CARCH.tar.gz")

_runtime=2024.13.1.242 # nearest to 2024.13.1.193
case "$CARCH" in
    aarch64)
        _igor=linux/arm64/Igor
        ;;
    x86_64)
        _igor=linux/x64/Igor
        ;;
    *)
        echo "Unsupported arch $CARCH found."
        exit 1
esac

prepare() {
    if [[ -z "$MAKEPKG_GAMEMAKER_ACCESS_KEY" ]]
    then
        echo "\$MAKEPKG_GAMEMAKER_ACCESS_KEY is required."
        return 1
    fi
    mkdir -p igor
    bsdtar -x -C igor -f ./igor-$CARCH.zip
    chmod +x "$srcdir/igor/$_igor"
    echo "Fetching license file..."
    "$srcdir/igor/$_igor" runtime FetchLicense \
    	-ak="$MAKEPKG_GAMEMAKER_ACCESS_KEY" \
    	-of="$srcdir/license.plist"
    echo "Installing runtime..."
    "$srcdir/igor/$_igor" runtime Install $_runtime \
        -lf="$srcdir/license.plist" \
        -rp="$srcdir/runtimes" \
        -m="base,linux,linuxYYC"
    chmod +x "$srcdir/runtimes/runtime-$_runtime/bin/igor/$_igor"
    if [[ -f "steam-runtime-sdk-$_steam_runtime_code-$_steam_runtime-$CARCH.tar.gz" ]]
    then
        echo "Preparing steam runtime..."
        mkdir -p steam-runtime
        bsdtar -x -p -C steam-runtime -f "./steam-runtime-sdk-$_steam_runtime_code-$_steam_runtime-$CARCH.tar.gz" \
            --exclude 'dev/*'
        {
            echo "{"
            echo "\"machine.Platform Settings.Linux.steamrt_sdk_dir\" : \"$srcdir/steam-runtime\""
            echo "}"
        } > "$srcdir/Dijeweled-$pkgver/local_settings.json"
    fi
    # Linux does not ignore upper/lower case
    local -A patch_paths=([cus_input_box]=CUS_input_box
                          [obj_stats_m_button_down]=obj_stats_M_button_down
                          [obj_stats_m_button_up]=obj_stats_M_button_up)
    local obj
    for obj in "${!patch_paths[@]}"
    do
        if [[ -d "$srcdir/Dijeweled-$pkgver/objects/$obj" ]]
        then
            echo "Renaming $objects/obj to objects/${patch_paths[$obj]}..."
            mv "$srcdir/Dijeweled-$pkgver/objects/$obj" "$srcdir/Dijeweled-$pkgver/objects/${patch_paths[$obj]}"
            mv "$srcdir/Dijeweled-$pkgver/objects/${patch_paths[$obj]}/$obj.yy" \
                "$srcdir/Dijeweled-$pkgver/objects/${patch_paths[$obj]}/${patch_paths[$obj]}.yy"
        fi
    done
}

build() {
    cd "$srcdir/Dijeweled-$pkgver"
    # Ensure PATH contains correct content in chroot environment
    export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
    # https://github.com/bscotch/igor-build
    "$srcdir/runtimes/runtime-$_runtime/bin/igor/$_igor" linux Package \
        -lf="$srcdir/license.plist" \
        -rp="$srcdir/runtimes/runtime-$_runtime" \
        -project="$srcdir/Dijeweled-$pkgver/bej_temp_remaster.yyp" \
        -runtime="YYC" \
        -tf="Dijeweled-$pkgver.zip"
}

package() {
    depends=(gcc-libs glibc glu hicolor-icon-theme libcurl-gnutls libglvnd libx11
             libxext libxrandr libxxf86vm openal openssl-1.0 zlib)

    cd "$srcdir/Dijeweled-$pkgver"
    mkdir -p "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
    bsdtar -x -C "$pkgdir/usr/lib/$pkgname" -f "Dijeweled-$pkgver.zip"
    chown -R root:root "$pkgdir/usr/lib/$pkgname"
    install -Dm644 options/linux/icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    sed "s/\${YYDisplayName}/Dijeweled/g;s/\${YYProjectName}/$pkgname/g;" \
         "$srcdir/runtimes/runtime-$_runtime/linux/template.desktop" \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop"
    ln -srfv "$pkgdir/usr/lib/$pkgname/bej_temp_remaster" "$pkgdir/usr/bin/$pkgname"
    
}
