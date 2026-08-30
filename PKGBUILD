# Maintainer: alexvermaning0 <alex.boot@outlook.com>
pkgname=openmediabridge
pkgver=2.1.1
pkgrel=1
pkgdesc="Bridge media playback and synchronized lyrics to WebSocket clients via MPRIS. For Resonite VR, OBS overlays, and Discord status."
arch=('x86_64' 'aarch64')
url="https://github.com/alexvermaning0/OpenMediaBridge"
license=('Apache-2.0')
depends=('playerctl')
makedepends=('dotnet-sdk')
conflicts=('openmediabridge-bin')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexvermaning0/OpenMediaBridge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3861c7cbb61e9c6e44eedd48aeae6351b9bb63baef1035726d08b99530c82535')

build() {
    cd "${srcdir}/OpenMediaBridge-${pkgver}"

    # The csproj pins linux-x64; override it so aarch64 also builds.
    case "$CARCH" in
        x86_64)  _rid=linux-x64 ;;
        aarch64) _rid=linux-arm64 ;;
    esac

    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    export DOTNET_NOLOGO=1

    dotnet publish Linux/OpenMediaBridge.Linux.csproj \
        -c Release -r "$_rid" --self-contained \
        -p:RuntimeIdentifier="$_rid" \
        -o publish
}

package() {
    cd "${srcdir}/OpenMediaBridge-${pkgver}"

    install -Dm755 "publish/OpenMediaBridge"   "${pkgdir}/usr/lib/openmediabridge/OpenMediaBridge"
    install -Dm755 "publish/libe_sqlite3.so"   "${pkgdir}/usr/lib/openmediabridge/libe_sqlite3.so"
    install -Dm644 "LICENSE"                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/openmediabridge" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/usr/lib/openmediabridge${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export OPENMEDIABRIDGE_DATA_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/openmediabridge"
exec /usr/lib/openmediabridge/OpenMediaBridge "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/openmediabridge"
}
