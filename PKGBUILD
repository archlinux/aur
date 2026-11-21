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
    # 1. Копируем распакованное содержимое в /opt/vanyavpn/
    install -dm755 "${pkgdir}/opt/vanyavpn"
    cp -rp squashfs-root/* "${pkgdir}/opt/vanyavpn/"

    # 2. Права доступа на чтение и выполнение для всех пользователей (роли root:root)
    find "${pkgdir}/opt/vanyavpn" -type d -exec chmod 755 {} +
    find "${pkgdir}/opt/vanyavpn" -type f -exec chmod 644 {} +
    find "${pkgdir}/opt/vanyavpn" -type f -executable -exec chmod 755 {} +
    find "${pkgdir}/opt/vanyavpn" -name "*.so*" -exec chmod 755 {} +

    # 3. Настройка SUID для песочницы Electron (чтобы работать без --no-sandbox)
    if [ -f "${pkgdir}/opt/vanyavpn/chrome-sandbox" ]; then
        chmod 4755 "${pkgdir}/opt/vanyavpn/chrome-sandbox"
    fi

    # 4. Ярлык .desktop
    install -Dm644 "vanyavpn.desktop" \
        "${pkgdir}/usr/share/applications/vanyavpn.desktop"

    # 5. Иконка 128x128
    install -Dm644 "VanyaVPN.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/vanyavpn.png"

    # 6. Симлинк для терминала (ссылается на AppRun распакованной папки)
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/vanyavpn/AppRun "${pkgdir}/usr/bin/vanyavpn"

    # 7. Автоочистка застрявшего интерфейса outline-tun0 в systemd
    install -Dm644 "outline-controller-cleanup.conf" \
        "${pkgdir}/usr/lib/systemd/system/outline_proxy_controller.service.d/override.conf"
}
