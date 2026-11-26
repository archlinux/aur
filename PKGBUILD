# Maintainer: czyt <czytcn@gmail.com>
pkgname=mithka-bin
pkgver=1.13.10
pkgrel=1
pkgdesc="A fast, compact Telegram client built with Flutter and TDLib"
arch=('x86_64' 'aarch64')
url="https://mithka.ieb.app"
license=('BSD-3-Clause')
depends=('gtk3' 'libkeybinder3' 'alsa-lib' 'mpv')
optdepends=('networkmanager: connection status awareness')
provides=('mithka')
conflicts=('mithka')
options=('!strip' '!debug')

# The release date (20261115) is part of the asset file names.
_tagdate=20261126
source=(
    "mithka-${pkgver}-LICENSE::https://raw.githubusercontent.com/iebb/mithka/v${pkgver}/LICENSE"
    "mithka-${pkgver}-icon::https://raw.githubusercontent.com/iebb/mithka/v${pkgver}/assets/app_icon.png"
)
source_x86_64=("mithka-${pkgver}-${_tagdate}-linux-x64.tar.gz::https://github.com/iebb/mithka/releases/download/v${pkgver}/mithka-${pkgver}-${_tagdate}-linux-x64.tar.gz")
source_aarch64=("mithka-${pkgver}-${_tagdate}-linux-arm64.tar.gz::https://github.com/iebb/mithka/releases/download/v${pkgver}/mithka-${pkgver}-${_tagdate}-linux-arm64.tar.gz")
sha256sums=('8320bc58c5839b20a4e9f7531d13082336a9ff0a2599fe2a9d9a6faf4bee47fa'
            '8010ea96d90e816f8c080597bf6616466d475395610c749e3bea311519fec7fc')
sha256sums_x86_64=('18a75ce6c2cc2b991680a1cdadcbe8f55097b830a6f672f109bfccee97d142f0')
sha256sums_aarch64=('a1a4c25ae98d8387d6bcce31c2855f2a74815b6cc96c6063370335664839aba4')

package() {
    local _arch
    case "$CARCH" in
        x86_64)  _arch=x64 ;;
        aarch64) _arch=arm64 ;;
    esac
    local _appdir="${srcdir}/Mithka"

    # Keep the bundle layout: mithka resolves its Flutter engine and plugin
    # libraries relative to its own location ($ORIGIN/lib).
    install -dm755 "${pkgdir}/opt/mithka"
    cp -a "${_appdir}/." "${pkgdir}/opt/mithka/"

    install -Dm644 "${srcdir}/mithka-${pkgver}-icon" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/mithka.png"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/mithka/mithka "${pkgdir}/usr/bin/mithka"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/mithka.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Mithka
GenericName=Telegram Client
Comment=A fast, compact Telegram client built with Flutter and TDLib
Exec=/usr/bin/mithka
Icon=mithka
Terminal=false
StartupNotify=true
Categories=Network;InstantMessaging;
StartupWMClass=Mithka
EOF

    install -Dm644 "${srcdir}/mithka-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
