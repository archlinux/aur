# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=telemost
pkgver=2.30.5.8321
pkgrel=1
pkgdesc="Yandex video conferencing client (Wine). Camera and screen sharing may not work under Wine."
arch=('x86_64')
url="https://telemost.yandex.com"
license=('LicenseRef-proprietary')
depends=('wine')
makedepends=('msitools' 'icoutils' 'jq')
source=("${pkgname}-${pkgver}.msi::https://disk.cdn.yandex.net/update/stable/ef60ee608fc67265be7ec794ad4b0290/YandexTelemostSetup.msi"
        "telemost.desktop")
sha256sums=('80fc873488046ebdd772523a2a7217f1da0d925908827e49795a2a3531254711'
            'f76a203977c050cda625835166f73a8771bb867b2fe163781051afc2afbb25a0')
options=('!strip' '!debug')

_api_url="https://cloud-api.yandex.net/v1/telemost/clients/v2-win64/installer"

latestver() {
    curl -s "$_api_url" | jq -r .version
}

prepare() {
    # Extract MSI with proper directory layout
    msiextract -C "$srcdir" "${pkgname}-${pkgver}.msi"

    # Extract icon from MSI (Icon.Icon.ico is in the raw archive)
    7z x -o"$srcdir" "${pkgname}-${pkgver}.msi" 'Icon.Icon.ico' -y > /dev/null

    # Convert ICO to individual PNGs
    cd "$srcdir"
    icotool -x Icon.Icon.ico
}

package() {
    local _appdir="$srcdir/Yandex/YandexTelemost"

    # Remove update service (not needed in packaged install)
    rm -f "$_appdir/F.UpdateServiceExe"

    # Install application files
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -a "$_appdir/"* "$pkgdir/opt/$pkgname/"

    # License reference
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    echo "Proprietary. See https://yandex.com/legal/telemost_termsofuse/" \
        > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icons (all sizes from ICO)
    for icon in "$srcdir"/Icon.Icon_*_*x*x*.png; do
        size=$(echo "$icon" | sed 's/.*_\([0-9]*\)x[0-9]*x[0-9]*.png/\1/')
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    done

    # Desktop file
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Wrapper script
    install -Dm755 /dev/null "$pkgdir/usr/bin/$pkgname"
    cat << 'EOF' > "$pkgdir/usr/bin/$pkgname"
#!/bin/bash
export WINEARCH=win64
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/telemost/wine"
export WINEDEBUG=-all

# Initialize Wine prefix on first run
if [ ! -d "$WINEPREFIX" ]; then
    mkdir -p "$WINEPREFIX"
    wineboot -u 2>/dev/null
    # Disable DLLs that crash under Wine during WebRTC video sessions:
    # dsengine.dll - DirectShow capture engine (no real camera support in Wine)
    # wmfengine.dll - WMF HW video decoder (crashes on codec init)
    wine reg add "HKCU\Software\Wine\DllOverrides" /v dsengine /t REG_SZ /d "" /f 2>/dev/null
    wine reg add "HKCU\Software\Wine\DllOverrides" /v wmfengine /t REG_SZ /d "" /f 2>/dev/null
fi

cd /opt/telemost
exec wine YandexTelemost.exe "$@"
EOF
}
