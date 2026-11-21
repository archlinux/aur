# Maintainer: Vanya <your@email.com>
pkgname=vanyavpn-appimage
pkgver=1.0.0
pkgrel=2
pkgdesc="VanyaVPN — VPN-клиент (нативная распаковка с поддержкой TUN capabilities)"
arch=('x86_64')
url="https://vanyavpn.com"
license=('MIT')
depends=('hicolor-icon-theme' 'libcap' 'nss' 'cairo' 'libnotify')
options=('!strip')
provides=('vanyavpn')
conflicts=('vanyavpn')
install=vanyavpn.install
source=(
    "VanyaVPN.AppImage::https://storage.googleapis.com/vanyavpn/apps/VanyaVPN.AppImage"
    "vanyavpn.desktop"
    "VanyaVPN.png"
    "outline-controller-cleanup.conf"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    chmod +x "VanyaVPN.AppImage"
    rm -rf squashfs-root
    ./VanyaVPN.AppImage --appimage-extract
}

package() {
    # 1. Копируем распакованный squashfs-root в /opt/vanyavpn/
    install -dm755 "${pkgdir}/opt/vanyavpn"
    cp -rp squashfs-root/* "${pkgdir}/opt/vanyavpn/"

    # 2. Выставляем права на чтение и выполнение для всех пользователей (+rX)
    # Это гарантирует, что папки 755, а бинарники сохраняют +x
    chmod -R a+rX "${pkgdir}/opt/vanyavpn"

    # 3. Гарантируем исполняемость ключевых файлов
    chmod +x "${pkgdir}/opt/vanyavpn/AppRun"
    if [ -f "${pkgdir}/opt/vanyavpn/vanyavpn" ]; then
        chmod +x "${pkgdir}/opt/vanyavpn/vanyavpn"
    fi

    # 4. Настройка SUID для песочницы Electron
    if [ -f "${pkgdir}/opt/vanyavpn/chrome-sandbox" ]; then
        chmod 4755 "${pkgdir}/opt/vanyavpn/chrome-sandbox"
    fi

    # 5. Установка .desktop и иконки
    install -Dm644 "vanyavpn.desktop" \
        "${pkgdir}/usr/share/applications/vanyavpn.desktop"
    install -Dm644 "VanyaVPN.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vanyavpn.png"

    # 6. Создание симлинка в /usr/bin/vanyavpn (на AppRun)
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/vanyavpn/AppRun "${pkgdir}/usr/bin/vanyavpn"

    # 7. Конфиг автоочистки systemd
    install -Dm644 "outline-controller-cleanup.conf" \
        "${pkgdir}/usr/lib/systemd/system/outline_proxy_controller.service.d/override.conf"
}
