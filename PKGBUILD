# See `Access Key` section of https://manual.gamemaker.io/lts/en/Settings/Building_via_Command_Line.htm
# to create an access key of GameMakerStudio. Then set it as environment variable MAKEPKG_GAMEMAKER_ACCESS_KEY
# so we can use it to create license plist file, which is required for building game.

pkgname=dijeweled
pkgver=1.18
pkgrel=1
pkgdesc="A fan-made Bejeweled game."
arch=(x86_64)
url=https://github.com/LDinos/Dijeweled
license=(AGPL-3.0-or-later)
makedepends=(ffmpeg gamemaker-steamruntime-sdk-bin rsync unzip zip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LDinos/Dijeweled/archive/refs/tags/v$pkgver.tar.gz")
# https://github.com/bscotch/igor-setup
# A bootstrapper used for downloading full runtime.
source_x86_64=("igor-x86_64.zip::https://gms.yoyogames.com/igor_linux-x64.zip")
sha256sums=('d10cd913a8b52c3f0f276b14f66e4afb1ed96284259a9d2114e8e99a56dcaa9f')
sha256sums_x86_64=('cb4ba26356e89b7d95ea3a2d4910ba6d4d795e60147ae350eafadb74390f6895')

_runtime=2024.13.1.242 # nearest to 2024.13.1.193
_igor=linux/x64/Igor

prepare() {
    chmod +x "$srcdir/$_igor"
    echo "Fetching license file..."
    "$srcdir/$_igor" runtime FetchLicense \
    	-ak="$MAKEPKG_GAMEMAKER_ACCESS_KEY" \
    	-of="$srcdir/license.plist"
    echo "Installing runtime..."
    "$srcdir/$_igor" runtime Install $_runtime \
        -lf="$srcdir/license.plist" \
        -rp="$srcdir/runtimes" \
        -m="base,linux,linuxYYC"
    chmod +x "$srcdir/runtimes/runtime-$_runtime/bin/igor/$_igor"
    # Linux does not ignore upper/lower case
    local -A patch_paths=([cus_input_box]=CUS_input_box
                          [obj_stats_m_button_down]=obj_stats_M_button_down
                          [obj_stats_m_button_up]=obj_stats_M_button_up)
    local obj
    for obj in "${!patch_paths[@]}"
    do
        if [[ -d "$srcdir/Dijeweled-$pkgver/objects/$obj" ]]
        then
            echo "Renaming objects/$obj to objects/${patch_paths[$obj]}..."
            mv "$srcdir/Dijeweled-$pkgver/objects/$obj" "$srcdir/Dijeweled-$pkgver/objects/${patch_paths[$obj]}"
            mv "$srcdir/Dijeweled-$pkgver/objects/${patch_paths[$obj]}/$obj.yy" \
                "$srcdir/Dijeweled-$pkgver/objects/${patch_paths[$obj]}/${patch_paths[$obj]}.yy"
        fi
    done
}

build() {
    cd "$srcdir/Dijeweled-$pkgver"
    # https://github.com/bscotch/igor-build
    "$srcdir/runtimes/runtime-$_runtime/bin/igor/$_igor" linux Package \
        -lf="$srcdir/license.plist" \
        -rp="$srcdir/runtimes/runtime-$_runtime" \
        -project="$srcdir/Dijeweled-$pkgver/bej_temp_remaster.yyp" \
        -runtime="YYC" \
        -tf="Dijeweled-$pkgver.zip"
}

package() {
    depends=(gcc-libs glibc glu hicolor-icon-theme libcurl-gnutls libglvnd libpulse libx11
             libxext libxfixes libxrandr libxxf86vm openal openssl-1.0 zlib)

    cd "$srcdir/Dijeweled-$pkgver"
    mkdir -p "$pkgdir/usr/lib/$pkgname" "$pkgdir/usr/bin"
    bsdtar -x -C "$pkgdir/usr/lib/$pkgname" -f "Dijeweled-$pkgver.zip" --no-same-owner
    install -Dm644 options/linux/icons/64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -Dm644 "$srcdir/runtimes/runtime-$_runtime/linux/template.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i "s/\${YYDisplayName}/Dijeweled/g;s/\${YYProjectName}/$pkgname/g;" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    ln -srfv "$pkgdir/usr/lib/$pkgname/bej_temp_remaster" "$pkgdir/usr/bin/$pkgname"
    
}
