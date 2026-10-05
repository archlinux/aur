# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=telegram-drive
pkgver=4.0.0
pkgrel=1
pkgdesc="Turn your Telegram account into an unlimited, secure cloud storage drive"
arch=('x86_64' 'aarch64')
url="https://github.com/caamer20/Telegram-Drive"
license=('LicenseRef-Upstream-Unspecified')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'libayatana-appindicator'
    'libsoup3'
    'webkit2gtk-4.1'
)
makedepends=(
    'cargo'
    'dbus'
    'gcc'
    'make'
    'nodejs'
    'npm'
    'rust'
)
optdepends=(
    'ffmpeg: HLS media transcoding'
    'gnome-keyring: persistent credential storage'
)
# !lto: C/C++-крейты (sqlite bundled, unrar) дают LTO-объекты,
# которые ld не может разрезолвить при финальной линковке
options=('!debug' '!lto')
conflicts=('telegram-drive-appimage')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/caamer20/Telegram-Drive/archive/refs/tags/v${pkgver}.tar.gz")
# codeload распаковывает архив в каталог с именем репозитория
_src="Telegram-Drive-${pkgver}" 
sha256sums=('1cd009d3e222578a179cfd2b635d4b180ab8d0ad59c24a534e2d81ed4d8845c9')

build() {
    cd "${srcdir}/${_src}/app"

    export CARGO_HOME="${srcdir}/cargo-home"
    export npm_config_cache="${srcdir}/npm-cache"

    npm ci --no-audit --no-fund \
        --fetch-retries=5 \
        --fetch-retry-mintimeout=10000 \
        --fetch-retry-maxtimeout=120000

    # Собирать нужно именно через Tauri CLI, а не cargo build напрямую:
    # только он встраивает dist/ (собранный vite фронтенд) в бинарник.
    # При cargo build окно открывается, но остаётся пустым серым прямоугольником.
    # --no-bundle — AppImage/deb/rpm собирает сам апстрим, нам нужен только бинарник.
    npm run tauri build -- --no-bundle
}

package() {
    cd "${srcdir}/${_src}"

    install -Dm755 "app/src-tauri/target/release/app" \
        "${pkgdir}/usr/bin/telegram-drive"

    local size
    for size in 32x32 64x64 128x128 128x128@2x; do
        install -Dm644 "app/src-tauri/icons/${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/com.cameronamer.telegramdrive.png"
    done

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/com.cameronamer.telegramdrive.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Telegram Drive
Comment=Browse and manage files stored in your Telegram account
Exec=telegram-drive
Icon=com.cameronamer.telegramdrive
Terminal=false
Categories=Network;FileTransfer;Utility;
StartupWMClass=app
StartupNotify=true
EOF

    install -Dm644 "packaging/arch/UPSTREAM-LICENSE-NOTICE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}