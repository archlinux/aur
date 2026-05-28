# Maintainer: LurkHub <LurkHub@yandex.ru>
pkgname=sovet
pkgver=2.22.1
pkgrel=1
pkgdesc="Корпоративная платформа для совместной работы: чат, видеоконференции, задачи, файлы. Аналог Microsoft Teams. Сервер в России."
arch=('x86_64')
url="https://sovetchat.ru"
license=('custom')
depends=('fuse2')
options=('!strip')
source_x86_64=("Soviet_${pkgver}_amd64.AppImage::https://updates.sovetchat.ru/downloads/Soviet_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('fb3006aeb2bebdc1ba0282d56dbdc2c1364e42fcd60fe182215af8c02abf5f7a')

prepare() {
    chmod +x "Soviet_${pkgver}_amd64.AppImage"
    ./"Soviet_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    install -dm777 "${pkgdir}/opt/sovet"
    install -Dm755 "Soviet_${pkgver}_amd64.AppImage" "${pkgdir}/opt/sovet/sovet.AppImage"
    chmod 777 "${pkgdir}/opt/sovet/sovet.AppImage"

    # Иконка — в pixmaps и в hicolor (для KDE/GNOME)
    install -Dm644 squashfs-root/sovietmsg.png \
        "${pkgdir}/usr/share/pixmaps/sovet.png"
    install -Dm644 squashfs-root/sovietmsg.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/sovet.png"

    # Ярлык в меню
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/sovet.desktop" << EOF
[Desktop Entry]
Name=Совет
Comment=Корпоративная платформа: чат, видеоконференции, задачи
Exec=/opt/sovet/sovet.AppImage
Icon=sovet
Type=Application
Categories=Network;Chat;
StartupNotify=true
StartupWMClass=sovietmsg
EOF

    # Обёртка в PATH
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/sovet" << 'EOF'
#!/bin/bash
exec /opt/sovet/sovet.AppImage "$@"
EOF
}
