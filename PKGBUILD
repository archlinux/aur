# See `Access Key` section of https://manual.gamemaker.io/lts/en/Settings/Building_via_Command_Line.htm
# to create an access key of GameMakerStudio. The set it as environment variable MAKEPKG_GAMEMAKER_ACCESS_KEY
# so we can use it to create license plist file, which is required for building game.

pkgname=dijeweled
pkgver=1.17
pkgrel=1
pkgdesc="A fan-made Bejeweled game."
arch=(x86_64)
url=https://github.com/LDinos/Dijeweled
license=(LicenseRef-unknown)
makedepends=(ffmpeg rsync unzip zip)
# TODO: v.1.17 seems to be a typo according to previous tags
_tag=v.1.17
source=("$pkgname-$pkgver.tar.gz::https://github.com/LDinos/Dijeweled/archive/refs/tags/$_tag.tar.gz")
# https://github.com/bscotch/igor-setup
# https://help.gamemaker.io/hc/en-us/articles/235186168-Setting-Up-For-Ubuntu
_steam_runtime_code=scout
_steam_runtime=0.20241024.105847 # latest-steam-client-general-availability
source_x86_64=("igor-x86_64.zip::https://gms.yoyogames.com/igor_linux-x64.zip"
               "steam-runtime-sdk-$_steam_runtime_code-$_steam_runtime-x86_64.tar.gz::https://repo.steampowered.com/steamrt-images-$_steam_runtime_code/snapshots/$_steam_runtime/com.valvesoftware.SteamRuntime.Sdk-amd64%2Ci386-$_steam_runtime_code-sysroot.tar.gz")
sha256sums=('93e7d3bdfd312212f4b6b3505550f560a5575d43ff837f0825bfc5747e06faf4')
sha256sums_x86_64=('da9b2fdb225dd764babfb5d922b8de7dd215cd21481795ab2242c650ddcd53cd'
                   'd79f2f1c1ad42c76ae46aa75c4a9641655fbe9b928b1fc645cbff45467d77359')
noextract=("igor-$CARCH.zip"
           "steam-runtime-sdk-$_steam_runtime_code-$_steam_runtime-$CARCH.tar.gz")

_runtime=2022.9.1.66 # nearest to 2022.9.1.51

prepare() {
    if [[ -z "$MAKEPKG_GAMEMAKER_ACCESS_KEY" ]]
    then
        echo "\$MAKEPKG_GAMEMAKER_ACCESS_KEY is required."
        return 1
    fi
    mkdir -p igor
    bsdtar -x -C igor -f ./igor-$CARCH.zip
    chmod +x ./igor/Igor
    echo "Fetching license file..."
    ./igor/Igor runtime FetchLicense \
    	-ak="$MAKEPKG_GAMEMAKER_ACCESS_KEY" \
    	-of="$srcdir/license.plist"
    echo "Installing runtime..."
    ./igor/Igor runtime Install $_runtime \
        -lf="$srcdir/license.plist" \
        -rp="$srcdir/runtimes" \
        -m="base,linux,linuxYYC"
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
        } > "Dijeweled-$_tag/local_settings.json"
    fi
}

build() {
    local _arch _igor
    case "$CARCH" in
        aarch64)
            _arch=arm64
            ;;
        x86_64)
            _arch=x64
            ;;
        *)
            echo "Unsupported arch $CARCH found."
            return 1
    esac
    _igor="$srcdir/runtimes/runtime-$_runtime/bin/igor/linux/$_arch/Igor"
    chmod +x "$_igor"
    cd "$srcdir/Dijeweled-$_tag"
    # Ensure PATH contains correct content in chroot environment
    export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
    # https://github.com/bscotch/igor-build
    "$_igor" linux Package \
        -lf="$srcdir/license.plist" \
        -rp="$srcdir/runtimes/runtime-$_runtime" \
        -project="$srcdir/Dijeweled-$_tag/bej_temp_remaster.yyp" \
        -runtime="YYC" \
        -tf="Dijeweled-$pkgver.zip"
}

package() {
    depends=(gcc-libs glibc glu hicolor-icon-theme libcurl-gnutls libglvnd libx11
             libxext libxrandr libxxf86vm openal openssl-1.0 zlib)

    cd "$srcdir/Dijeweled-$_tag"
    mkdir -p "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
    bsdtar -x -C "$pkgdir/usr/lib/$pkgname" -f "Dijeweled-$pkgver.zip"
    chown -R root:root "$pkgdir/usr/lib/$pkgname"
    install -Dm644 options/linux/icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    sed "s/\${YYDisplayName}/Dijeweled/g;s/\${YYProjectName}/$pkgname/g;" \
         "$srcdir/runtimes/runtime-$_runtime/linux/template.desktop" \
    | install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop"
    ln -srfv "$pkgdir/usr/lib/$pkgname/bej_temp_remaster" "$pkgdir/usr/bin/$pkgname"
    
}
