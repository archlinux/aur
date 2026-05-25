# Maintainer: LurkHub <LurkHub@yandex.ru>
pkgname=sovet
pkgver=2.19.0
pkgrel=1
pkgdesc="Корпоративная платформа для совместной работы: чат, видеоконференции, задачи, файлы. Аналог Microsoft Teams. Сервер в России."
arch=('x86_64')
url="https://sovetchat.ru"
license=('custom')
depends=('fuse2')
options=('!strip')
source_x86_64=("Soviet_${pkgver}_amd64.AppImage::https://updates.sovetchat.ru/downloads/Soviet_${pkgver}_amd64.AppImage")
sha256sums_x86_64=('36d231e5e6486daf41c9ce2a3d39fa5ef56de0961d16df975d768622d0fceed4')

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
Comment=ЗАЩИЩЕННЫЙ МЕССЕНДЖЕР
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
